import Foundation

public struct ResponseData {
    public let statusCode: Int
    public let data: Data?
    public let error: Error?
    public let headers: [String: String]?
    
    /// Initializer for success responses
    internal init(statusCode: Int, data: Data, headers: [String: String]?) {
        self.statusCode = statusCode
        self.data = data
        self.error = nil
        self.headers = headers
    }
    
    /// Initializer for failed responses
    internal init(statusCode: Int, error: Error, headers: [String: String]?) {
        self.statusCode = statusCode
        self.data = nil
        self.error = error
        self.headers = headers
    }
    
    /// Generic initializer
    public init(statusCode: Int, data: Data?, error: Error?, headers: [String: String]?) {
        self.statusCode = statusCode
        self.data = data
        self.error = nil
        self.headers = headers
    }
}

public extension ResponseData {
    var isSuccess: Bool {
        return statusCode >= 200 && statusCode <= 299
    }
}
