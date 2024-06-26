//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski and the repository contributors.
//  Licensed under the MIT License.
//

import SwiftUI
import VirtualCoinKit

struct SideBarsView: View {
    @State private var selectedItem: SideBarNavigationItem? = .favourites
    
    var body: some View {
        List {
            
            // Favourites view.
            NavigationLink(
                destination:FavouritesView(),
                tag: SideBarNavigationItem.favourites,
                selection: $selectedItem
            ) {
                Label("shared.favourites", systemImage: "star.fill")
            }
            
            // All currencies view.
            NavigationLink(
                destination: CoinsView(),
                tag: SideBarNavigationItem.currencies,
                selection: $selectedItem
            ) {
                Label("shared.all-currencies", systemImage: "bitcoinsign.circle.fill")
            }

            // Exchanges view.
            NavigationLink(
                destination: ExchangesView(),
                tag: SideBarNavigationItem.exchanges,
                selection: $selectedItem
            ) {
                Label("shared.exchanges", systemImage: "arrow.triangle.2.circlepath.circle.fill")
            }
            
            // Alerts view.
            NavigationLink(
                destination: AlertsView(),
                tag: SideBarNavigationItem.alerts,
                selection: $selectedItem
            ) {
                Label("shared.alerts", systemImage: "bell.fill")
            }
            
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("vCoin")
    }
}

struct SideBarsView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarsView()
    }
}
