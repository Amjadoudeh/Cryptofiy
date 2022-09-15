
import SwiftUI

@main
struct CryptofiyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .navigationBarHidden(true)
        }
    }
}
