import Foundation
import Combine

@MainActor
final class JobDetailsViewModel: ObservableObject {
    var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    
    let job: Job
    private let router: AppRouter

    init(job: Job, router: AppRouter) {
        self.job = job
        self.router = router
    }

    func goBack() { router.pop() }
}
