import SwiftUI

struct SalaryBadgeView: View {
    let salary: String
    var body: some View {
        Text(salary)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, Spacing.sm)
            .padding(.vertical, Spacing.xs)
            .background(AppColors.salaryBadge)
            .foregroundStyle(AppColors.salaryText)
            .clipShape(Capsule())
    }
}
