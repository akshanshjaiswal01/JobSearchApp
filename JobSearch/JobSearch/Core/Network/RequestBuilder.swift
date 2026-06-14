import Foundation

struct RequestBuilder {
    static func build(baseURL: URL, endpoint: Endpoint) throws -> URLRequest {
        guard let url = URL(string: endpoint.path, relativeTo: baseURL) else {
            throw NetworkError.invalidResponse
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.timeoutInterval = 30
        endpoint.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        return request
    }
}
