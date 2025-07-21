import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: (() -> Void)
    @State private var showAlert = true
    var isJailBreak: Bool = false

    var body: some View {
        if isJailBreak {
            Color.clear
            .alert(ConstantsStrings.jailbreakDetected.rawValue, isPresented: $showAlert) {
                Button(ConstantsStrings.exitApp.rawValue, action: retryAction)
            } message: {
                Text(message)
            }
        } else {
            Color.clear
            .alert(ConstantsStrings.error.rawValue, isPresented: $showAlert) {
                Button(ConstantsStrings.retryConnection.rawValue, action: retryAction)
                Button(ConstantsStrings.cancel.rawValue, role: .cancel) { }
            } message: {
                Text(message)
            }
        }
    }
}
