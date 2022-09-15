import SwiftUI

struct HomeView: View {
    @State private var showProtfolio: Bool = false
    var body: some View {
        ZStack {
            //MARK: background layer
            Color.theme.background
            
            //MARK: Content layer
            VStack {
                HStack {
                    withAnimation(.none) {
                        CircleButtonView(iconName: showProtfolio ? "plus" : "info")
                    }
                    
                    Spacer()
                    withAnimation(.none) {
                        Text(showProtfolio ? "Protfolio" : "Live Prices")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.theme.accent)
                    }
                    
                    Spacer()
                    CircleButtonView(iconName: "chevron.right")
                        .rotationEffect(Angle(degrees: showProtfolio ? 0 : 180))
                        .onTapGesture {
                            withAnimation {
                                showProtfolio.toggle()
                            }
                        }
                }
                .padding(.horizontal)
                
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
