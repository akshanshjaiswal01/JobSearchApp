import SwiftUI

struct CompanyInfoView: View {
    let job: Job

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            AppTypography.headline("About \(job.company)")
            AppTypography.body(job.companyOverview)
            InfoRow(label: "Website", value: job.companyWebsite)
            InfoRow(label: "Size", value: job.companySize)
            InfoRow(label: "Industry", value: job.industry)
        }
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    var body: some View {
        HStack {
            Text(label).font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
            Text(value).font(.caption)
        }
    }
}
