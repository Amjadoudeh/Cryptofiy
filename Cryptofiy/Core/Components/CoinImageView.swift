import SwiftUI

struct CoinImageView: View {
    @EnvironmentObject var vm: HomeViewModel
    let coin: CoinModel
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: coin.image )) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
    }
}
struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin )
    }
}
