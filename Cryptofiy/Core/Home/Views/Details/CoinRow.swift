import SwiftUI

struct CoinRow: View {
    let coin: CoinModel
    let showHoldingsColum: Bool
    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(maxWidth: 30)
            Circle()
                .frame(width: 30,height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
            Spacer()
            if showHoldingsColum {
                VStack {
                    Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                        .bold()
                    Text((coin.currentHoldings ?? 0).asNumberString())
                }
                .foregroundColor(Color.theme.accent)
               
            }
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundColor(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                        Color.theme.green :
                        Color.theme.red
                    )
            }
            .frame(width: UIScreen.main.bounds.width / 3.5)
        }
        .font(.headline)
    }
}

struct CoinRow_Previews: PreviewProvider {
    static var previews: some View {
        CoinRow(coin: dev.coin,showHoldingsColum: true)
    }
}
