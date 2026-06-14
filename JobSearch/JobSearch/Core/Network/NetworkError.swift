import Foundation

enum NetworkError: Error, Equatable {
    case noInternet
    case timeout
    case invalidResponse
    case decodingFailure(String)
    case serverError(Int)
    case unknown(String)

    var appError: AppError {
        switch self {
        case .noInternet: return .offline
        case .timeout: return AppError(message: "Request timed out. Please try again.")
        case .invalidResponse: return AppError(message: "Invalid server response.")
        case .decodingFailure(let msg): return AppError(message: "Data error: \(msg)")
        case .serverError(let code): return AppError(message: "Server error (\(code)).")
        case .unknown(let msg): return AppError(message: msg)
        }
    }
}
