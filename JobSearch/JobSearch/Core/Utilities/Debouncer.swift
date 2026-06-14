import Foundation

actor Debouncer {
    private var task: Task<Void, Never>?

    func debounce(delay: Duration = .milliseconds(300), action: @escaping @Sendable () async -> Void) {
        task?.cancel()
        task = Task {
            try? await Task.sleep(for: delay)
            guard !Task.isCancelled else { return }
            await action()
        }
    }
}
