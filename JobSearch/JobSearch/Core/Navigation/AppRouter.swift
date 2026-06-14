import Foundation
import Combine

@MainActor
final class AppRouter: ObservableObject {
    @Published var selectedJob: Job?
    @Published var path: [Job] = []
    init(selectedJob: Job? = nil, path: [Job] = []) {
        self.selectedJob = selectedJob
        self.path = path
    }

    func showDetails(for job: Job) { path.append(job) }
    func pop() { if !path.isEmpty { path.removeLast() } }
}
