import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: Spacing.md) {
            ForEach(0..<5, id: \.self) { _ in SkeletonCardView() }
        }
        .padding()
        .accessibilityLabel("Loading jobs")
    }
}

struct SkeletonCardView: View {
    @State private var shimmer = false
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(.systemGray5))
            .frame(height: 120)
            .opacity(shimmer ? 0.5 : 1.0)
            .animation(.easeInOut(duration: 0.8).repeatForever(), value: shimmer)
            .onAppear { shimmer = true }
    }
}
