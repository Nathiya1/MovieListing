import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView(ConstantsStrings.loading.rawValue)
            .foregroundStyle(.white)
    }
}
#Preview {
    LoadingView()
}
