import Foundation

public protocol ApiClientProtocol {
    var restClient: RestClient { get }
    
    init(restClient: RestClient)
    
    func execute<Task: NetworkTask>(task: Task, success: @escaping (Task.ResponseModel) -> Void, failure: @escaping (String) -> Void)
    
    func handleSuccess<Task: NetworkTask>(response: ResponseData, task: Task, success: @escaping (Task.ResponseModel) -> Void, failure: @escaping (String) -> Void) throws
    
    func handleFailure<Task: NetworkTask>(response: ResponseData, task: Task, success: @escaping (Task.ResponseModel) -> Void, failure: @escaping (String) -> Void) throws
}
