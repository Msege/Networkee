import Alamofire
import Foundation

public class RestClient {
    
    // MARK: Private Properties
    private let session: Session
    private let configuration: ApiConfiguration
    
    // MARK: Initializers    
    public init(configuration: ApiConfiguration, session: Session) {
        self.configuration = configuration
        self.session = session
    }
    
    // MARK: Execution Methods
    public func execute<Task: NetworkTask>(task: Task, completion: @escaping (ResponseData) -> Void) {
        
        let requestUrl = URL(string: task.endpoint, relativeTo: configuration.baseUrl)!
        
        self.request(url: requestUrl, methodType: task.httpMethod, properties: task.request, completed: { (dataResponse) in
            let response = ResponseData(statusCode: dataResponse.response?.statusCode ?? 999, data: dataResponse.data, error: dataResponse.error, headers: dataResponse.response?.headers.dictionary)
            completion(response)
        })
    }
    
    // MARK: Execution Methods
    private func request(url: URL, methodType: HTTPMethodType, properties: Encodable, completed: @escaping (AFDataResponse<Data>) -> Void) {        
        let parameters = try? properties.asDictionary()

        session.request(url, method: methodType.type, parameters: parameters, encoding: methodType.encoding).validate().responseData { (dataResponse) in
            completed(dataResponse)
        }
    }
    
}
