//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski and the repository contributors.
//  Licensed under the MIT License.
//

import SwiftUI
import VirtualCoinKit

struct TabsView: View {

    var body: some View {
        TabView {

            // Favourites view.
            NavigationView {
                FavouritesView()
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("shared.favourites")
            }

            // All currencies view.
            NavigationView {
                CoinsView()
            }
            .tabItem {
                Image(systemName: "bitcoinsign.circle.fill")
                Text("shared.all-currencies")
            }
            
            // Exchanges view.
            NavigationView {
                ExchangesView()
            }
            .tabItem {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("shared.exchanges")
            }
            
            // Alerts view.
            NavigationView {
                AlertsView()
            }
            .tabItem {
                Image(systemName: "bell.fill")
                Text("shared.alerts")
            }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
            .environment(\.managedObjectContext, CoreDataHandler.preview.container.viewContext)
    }
}
