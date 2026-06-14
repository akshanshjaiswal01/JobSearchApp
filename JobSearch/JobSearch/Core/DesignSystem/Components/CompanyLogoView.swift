import SwiftUI

struct CompanyLogoView: View {
    let symbolName: String
    var body: some View {
        Image(systemName: symbolName)
            .font(.title2)
            .foregroundStyle(.white)
            .frame(width: 44, height: 44)
            .background(Color.accentColor.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
