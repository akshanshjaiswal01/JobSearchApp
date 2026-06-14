import SwiftUI

struct EmptyStateView: View {
    let message: String
    var retry: (() -> Void)?

    var body: some View {
        VStack(spacing: Spacing.md) {
            Image(systemName: "briefcase")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
            Text(message).multilineTextAlignment(.center).foregroundStyle(.secondary)
            if let retry {
                AppButton(title: "Refresh", action: retry).frame(maxWidth: 200)
            }
        }
        .padding(Spacing.xl)
    }
}
