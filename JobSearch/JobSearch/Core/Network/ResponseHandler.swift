import Foundation

struct ResponseHandler {
    static func handle<T: Decodable>(data: Data, response: URLResponse?, type: T.Type) throws -> T {
        guard let http = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
        guard (200...299).contains(http.statusCode) else { throw NetworkError.serverError(http.statusCode) }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailure(error.localizedDescription)
        }
    }
}
