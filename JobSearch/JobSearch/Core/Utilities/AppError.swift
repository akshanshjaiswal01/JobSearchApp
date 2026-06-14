import Foundation

struct AppError: Error, Equatable {
    let message: String
    let isOffline: Bool

    init(message: String, isOffline: Bool = false) {
        self.message = message
        self.isOffline = isOffline
    }

    static let offline = AppError(message: "No internet connection. Showing cached data.", isOffline: true)
    static let unknown = AppError(message: "Something went wrong. Please try again.")
}
