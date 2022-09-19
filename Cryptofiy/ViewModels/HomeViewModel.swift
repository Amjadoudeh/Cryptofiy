import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var protfiloCoins: [CoinModel] = []
    @Published var searchText: String = ""
    private let dataService = CoinDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        // to test the UI
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        //            self.allCoins.append(DeveloperPreview.instance.coin)
        //            self.protfiloCoins.append(DeveloperPreview.instance.coin)
        //        }
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        $searchText
            .combineLatest(dataService.$allCoins)
            .map { (text, startingCoins) ->[CoinModel] in
                guard !text.isEmpty else { return startingCoins }
                
                let lowercasedText = text.lowercased()
                
                return startingCoins.filter {(coin) -> Bool in
                    return coin.name.lowercased().contains(lowercasedText) ||
                    coin.symbol.lowercased().contains(lowercasedText) ||
                    coin.id.lowercased().contains(lowercasedText)
                }
            }
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}

