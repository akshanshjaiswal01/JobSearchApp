import Foundation

enum ViewState<T: Equatable>: Equatable {
    case idle
    case loading
    case loaded(T)
    case empty
    case error(AppError)

    static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.empty, .empty): return true
        case let (.loaded(a), .loaded(b)): return a == b
        case let (.error(a), .error(b)): return a == b
        default: return false
        }
    }
}
