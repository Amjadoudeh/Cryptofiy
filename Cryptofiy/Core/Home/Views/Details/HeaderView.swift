import SwiftUI

struct HeaderView: View {
    @State private var showProtfolio: Bool = false
    
    var body: some View {
        HStack {
            CircleButtonView(iconName: showProtfolio ? "plus" : "info")
                .background(
                    CircleButtonAnimationView(animate: $showProtfolio)
                )
            
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
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
