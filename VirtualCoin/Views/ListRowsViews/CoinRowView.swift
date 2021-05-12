//
//  CoinRowView.swift
//  VirtualCoin
//
//  Created by Marcin Czachurski on 18/04/2021.
//

import SwiftUI
import VirtualCoinKit

struct CoinRowView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @StateObject var coin: CoinViewModel
    
    var body: some View {

        HStack {
            CoinImageView(coin: coin)
            
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.headline)
                Text(coin.symbol)
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(coin.price.toFormattedPrice(currency: appViewModel.currencySymbol))
                    .font(.subheadline)
                    .foregroundColor(coin.changePercent24Hr > 0 ?.greenPastel : .redPastel)

                Text(coin.changePercent24Hr.toFormattedPercent())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: PreviewData.getCoinViewModel())
                .environmentObject(AppViewModel.preview)
                .preferredColorScheme(.dark)

            CoinRowView(coin: PreviewData.getCoinViewModel())
                .environmentObject(AppViewModel.preview)
                .preferredColorScheme(.light)
        }
        .previewLayout(.fixed(width: 360, height: 70))
    }
}
