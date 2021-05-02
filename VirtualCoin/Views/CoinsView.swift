//
//  ContentView.swift
//  VirtualCoin
//
//  Created by Marcin Czachurski on 17/04/2021.
//

import SwiftUI
import CoreData
import VirtualCoinKit

struct CoinsView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @EnvironmentObject var appViewModel: AppViewModel

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Favourite.coinSymbol, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Favourite>

    var body: some View {
        if let coins = appViewModel.coins {
            List(coins) { coin in
                NavigationLink(destination:CoinView(coin: coin).environmentObject(appViewModel)) {
                    CoinRowView(coin: coin)
                        .environmentObject(appViewModel)
                }
            }
            .navigationTitle("All currencies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        Image(systemName: "switch.2")
                    }
                }
            }
        }
        else {
            Text("Loading...")
        }
    }
}

struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView()
            .environmentObject(AppViewModel())
            .environment(\.managedObjectContext, CoreDataHandler.preview.container.viewContext)
    }
}
