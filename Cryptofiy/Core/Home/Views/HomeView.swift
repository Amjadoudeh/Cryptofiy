import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            //MARK: background layer
            Color.theme.background
            
            //MARK: Content layer
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
