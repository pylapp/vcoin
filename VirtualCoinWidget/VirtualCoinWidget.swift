//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski and the repository contributors.
//  Licensed under the MIT License.
//

import WidgetKit
import SwiftUI

@main
struct VirtualCoinWidget: Widget {
    let kind: String = "VirtualCoinWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            VirtualCoinWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("vCoin")
        .description("widget.show-prices")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .disableContentMarginsIfNeeded()
    }
}

extension WidgetConfiguration {
    func disableContentMarginsIfNeeded() -> some WidgetConfiguration {
        if #available(iOSApplicationExtension 15.0, *) {
            return self.contentMarginsDisabled()
        } else {
            return self
        }
    }
}
