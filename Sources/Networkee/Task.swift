import Alamofire

public protocol NetworkTask {
    associatedtype RequestModel: Codable
    associatedtype ResponseModel: Codable
    
    var endpoint: String { get }
    var httpMethod: HTTPMethodType { get }
    var request: RequestModel { get }
    
    init(request: RequestModel)
}

public extension NetworkTask {
    var encoding: ParameterEncoding {
        if httpMethod == .post {
            return JSONEncoding.prettyPrinted
        }
        else {
            return URLEncoding.default
        }
    }
}
