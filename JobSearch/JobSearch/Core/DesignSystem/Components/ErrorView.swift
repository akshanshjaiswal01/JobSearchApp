import SwiftUI

struct ErrorView: View {
    let error: AppError
    let retry: () -> Void

    var body: some View {
        VStack(spacing: Spacing.md) {
            Image(systemName: error.isOffline ? "wifi.slash" : "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
            Text(error.message).multilineTextAlignment(.center).foregroundStyle(.secondary)
            AppButton(title: "Retry", action: retry)
                .frame(maxWidth: 200)
        }
        .padding(Spacing.xl)
    }
}
