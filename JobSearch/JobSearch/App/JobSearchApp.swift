import SwiftUI

@main
struct JobSearchApp: App {
    @StateObject private var container = AppContainer()

    var body: some Scene {
        WindowGroup {
            JobListView(viewModel: container.makeJobListViewModel(), router: container.router)
                .environmentObject(container)
        }
    }
}
