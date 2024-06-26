//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski and the repository contributors.
//  Licensed under the MIT License.
//

import SwiftUI
import VirtualCoinKit

struct SettingsView: View {
    @EnvironmentObject private var coinsService: CoinsService
    @EnvironmentObject private var applicationStateService: ApplicationStateService
    @Environment(\.presentationMode) var presentationMode
    
    @State var matchSystem: Bool = true
    @State var isDarkMode: Bool = true
    @State private var selectedCurrency = Currencies.getDefaultCurrency()
    
    var body: some View {
        NavigationView {
            List {
                
                Section(header: Text("settings.section.main")) {
                    
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
                }
                
                Section(header: Text("settings.section.other")) {
                    NavigationLink(destination: ThirdPartyView()) {
                        Text("settings.section.third-parties")
                    }

                    HStack {
                        Text("settings.section.source-code")
                        Spacer()
                        Link("GitHub",
                              destination: URL(string: "https://github.com/mczachurski/vcoin")!)
                    }

                    HStack {
                        Text("settings.section.report-bug")
                        Spacer()
                        Link("settings.section.github-issues",
                              destination: URL(string: "https://github.com/mczachurski/vcoin/issues")!)
                    }
                    
                    HStack {
                        Text("settings.section.x-follow")
                        Spacer()
                        Link("@mczachurski",
                              destination: URL(string: "https://twitter.com/@mczachurski")!)
                    }
                    
                }
                
                Section {
                    HStack {
                        Text("settings.section.version")
                        Spacer()
                        Text(Bundle.main.appVersionNumber + " (\(Bundle.main.buildVersionNumber)")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("settings.section.settings"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.saveSettings()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("shared.done").bold()
            })
        }.onAppear {
            self.loadDefaultCurrency()
        }
    }
    
    private func loadDefaultCurrency() {
        let settingsHandler = SettingsHandler()
        let defaultSettings = settingsHandler.getDefaultSettings()
        
        if defaultSettings.currency != "" {
            self.selectedCurrency = Currency(symbol: defaultSettings.currency)
        }
    }
    
    private func saveSettings() {
        let settingsHandler = SettingsHandler()
        let defaultSettings = settingsHandler.getDefaultSettings()
        defaultSettings.currency = self.selectedCurrency.symbol
        
        CoreDataHandler.shared.save()
        coinsService.loadCoins(into: applicationStateService) { _ in }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
                .preferredColorScheme(.dark)
            
            SettingsView()
                .preferredColorScheme(.light)
        }
    }
}
