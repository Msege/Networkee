import Foundation

public protocol ApiConfiguration {
    var baseUrl: URL { get }
    var loggingEnabled: Bool { get }
}
