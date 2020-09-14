import Alamofire

internal extension HTTPMethodType {
    var type: HTTPMethod {
        return HTTPMethod(rawValue: self.rawValue)
    }
}
