//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski and the repository contributors.
//  Licensed under the MIT License.
//

import SwiftUI
import VirtualCoinKit
import NumericText

struct AlertDetailView: View {
    @EnvironmentObject private var applicationStateService: ApplicationStateService
    
    @Binding private var price: NSNumber?
    @Binding private var isPriceLower: Bool
    @Binding private var selectedCurrency: Currency
    @Binding private var selectedCoin: CoinViewModel
    
    init(price: Binding<NSNumber?>, isPriceLower: Binding<Bool>, currency: Binding<Currency>, coin: Binding<CoinViewModel>) {
        _price = price
        _isPriceLower = isPriceLower
        _selectedCurrency = currency
        _selectedCoin = coin
    }
    
    var body: some View {
        List {
            Section(header: Text("shared.values")) {
                HStack {
                    Text("alert.detail.notify")
                    Picker("", selection: $isPriceLower) {
                        Text("shared.lowerThan").textCase(.lowercase).tag(true)
                        Text("shared.greaterThan").textCase(.lowercase).tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                HStack {
                    Text("shared.price")
                    NumericTextField("shared.price", number: $price, isDecimalAllowed: true)
                        .multilineTextAlignment(.trailing)
                }
                
                Picker(selection: $selectedCurrency, label: Text("shared.currency.fiat")) {
                    ForEach(Currencies.allCurrenciesList, id: \.self) { currency in
                        HStack {
                            Text(currency.name)
                                .font(.body)
                            Text("(\(currency.symbol))")
                                .font(.footnote)
                                .foregroundColor(.accentColor)
                        }.tag(currency)
                    }
                }
                
                Picker(selection: $selectedCoin, label: Text("shared.currency.cryptocurrency")) {
                    ForEach(applicationStateService.coins, id: \.self) { coin in
                        HStack {
                            Text(coin.name)
                                .font(.body)
                            Text("(\(coin.symbol))")
                                .font(.footnote)
                                .foregroundColor(.accentColor)
                        }.tag(coin)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct AlertDetailView_Previews: PreviewProvider {
    @State private static var price: NSNumber? = 21.2
    @State private static var isPriceLower: Bool = true
    @State private static var currency = PreviewData.getCurrency()
    @State private static var coin = PreviewData.getCoinViewModel()

    static var previews: some View {
        AlertDetailView(price: $price, isPriceLower: $isPriceLower, currency: $currency, coin: $coin)
            .environmentObject(ApplicationStateService.preview)
    }
}
