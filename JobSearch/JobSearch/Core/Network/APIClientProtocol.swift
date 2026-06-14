import Foundation

protocol APIClientProtocol: Sendable {
    func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type) async throws -> T
}
