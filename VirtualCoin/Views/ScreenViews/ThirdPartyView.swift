//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski and the repository contributors.
//  Licensed under the MIT License.
//

import SwiftUI

struct ThirdPartyView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Link("https://coincap.io",
                     destination: URL(string: "https://coincap.io")!)
                Spacer()
                Text("third-parties.api")
                    .font(.footnote)
            }
            
            VStack(alignment: .leading)  {
                Link("https://github.com/pichukov/LightChart",
                     destination: URL(string: "https://github.com/pichukov/LightChart")!)
                Spacer()
                Text("third-parties.lightchart")
                    .font(.footnote)
            }
            
            VStack(alignment: .leading)  {
                Link("https://github.com/dmytro-anokhin/url-image",
                     destination: URL(string: "https://github.com/dmytro-anokhin/url-image")!)
                Spacer()
                Text("third-parties.url-image")
                    .font(.footnote)
            }
        }
        .navigationBarTitle(Text("third-parties.third-party"), displayMode: .inline)
    }
}

struct ThirdPartyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ThirdPartyView()
            }
            .preferredColorScheme(.dark)
            
            NavigationView {
                ThirdPartyView()
            }
            .preferredColorScheme(.light)
        }
    }
}
