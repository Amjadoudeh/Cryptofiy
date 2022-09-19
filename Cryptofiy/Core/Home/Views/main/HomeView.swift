import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @State var showProtfolio: Bool = false
    
    var body: some View {
        ZStack {
            //MARK: background layer
            Color.theme.background
            
            //MARK: Content layer
            VStack {
                HeaderView(showProtfolio: $showProtfolio)
                
                SearchBarView(searchText: $viewModel.searchText)
                columnTitles
                
                
                if !showProtfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                if showProtfolio {
                    protfolioCoinsList
                    .transition(.move(edge: .trailing))
                }
                
                
                
                
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
        .environmentObject(dev.homeViewModel)
    }
}

extension HomeView {
    private var allCoinsList: some View {
        List {
            ForEach(viewModel.allCoins) { coin in
                CoinRow(coin: coin, showHoldingsColum: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var protfolioCoinsList: some View {
        List {
            ForEach(viewModel.protfiloCoins) { coin in
                CoinRow(coin: coin, showHoldingsColum: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coins")
            Spacer()
            Text("Holdings")
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
