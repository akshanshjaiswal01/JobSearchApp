import Foundation
import os

final class APIClient: APIClientProtocol, @unchecked Sendable {
    private let session: URLSession
    private let baseURL: URL
    private let maxRetries: Int
    private let logger = Logger(subsystem: "com.jobfinder", category: "Network")

    init(session: URLSession = .shared, baseURL: URL = URL(string: "https://api.jobfinder.example.com")!, maxRetries: Int = 2) {
        self.session = session
        self.baseURL = baseURL
        self.maxRetries = maxRetries
    }

    func request<T: Decodable>(_ endpoint: Endpoint, type: T.Type) async throws -> T {
        var lastError: Error = NetworkError.unknown("Request failed")
        for attempt in 0...maxRetries {
            do {
                let request = try RequestBuilder.build(baseURL: baseURL, endpoint: endpoint)
                logger.info("Request: \(endpoint.method.rawValue) \(request.url?.absoluteString ?? "")")
                let (data, response) = try await session.data(for: request)
                return try ResponseHandler.handle(data: data, response: response, type: type)
            } catch let error as URLError where error.code == .notConnectedToInternet {
                throw NetworkError.noInternet
            } catch let error as URLError where error.code == .timedOut {
                lastError = NetworkError.timeout
            } catch let error as NetworkError {
                throw error
            } catch {
                lastError = NetworkError.unknown(error.localizedDescription)
            }
            if attempt < maxRetries { try await Task.sleep(nanoseconds: UInt64(pow(2.0, Double(attempt))) * 500_000_000) }
        }
        throw lastError
    }
}
