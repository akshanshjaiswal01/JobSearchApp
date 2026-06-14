import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
}

enum HTTPMethod: String { case get = "GET", post = "POST" }

struct JobsEndpoint: Endpoint {
    let path = "/jobs"
    let method: HTTPMethod = .get
    let headers: [String: String] = ["Accept": "application/json"]
}
