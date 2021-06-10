//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski. All rights reserved.
//

import WidgetKit
import SwiftUI
import LightChart
import VirtualCoinKit

struct LargeWidgetView: View {
    var viewModels: [WidgetViewModel]
    
    @Setting(\.currency) private var currencySymbol: String

    var body: some View {
        VStack {
            ForEach(viewModels.prefix(6).indices, id: \.self) { index in
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(viewModels[index].symbol)")
                                .foregroundColor(Color.main)
                                .font(.caption2)
                            Text("\(viewModels[index].name)")
                                .font(.caption2)
                        }
                        Spacer()
                        
                        LightChartView(data: viewModels[index].chart,
                                       type: .curved,
                                       visualType: .customFilled(color: .main,
                                                                 lineWidth: 2,
                                                                 fillGradient: LinearGradient(
                                                                    gradient: .init(colors: [.main(opacity: 0.5), .main(opacity: 0.1)]),
                                                                    startPoint: .init(x: 0.5, y: 1),
                                                                    endPoint: .init(x: 0.5, y: 0)
                                                                 )))
                            .frame(maxWidth: 80, maxHeight: .infinity)
                            .padding(.top, 2)
                            .padding(.bottom, 2)
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing){
                                Text("\(viewModels[index].price.toFormattedPrice(currency: currencySymbol))")
                                    .font(.caption2)
                                Text("\(viewModels[index].changePercent24Hr.toFormattedPercent())")
                                    .foregroundColor(viewModels[index].changePercent24Hr > 0 ?.greenPastel : .redPastel)
                                    .font(.caption2)
                            }
                        }
                        .frame(minWidth: 100, maxWidth: 100)
                    }
                    
                    if index + 1 < (viewModels.capacity > 6 ? 6 : viewModels.capacity) {
                        Divider()
                    }
                }
            }
        }
        .padding()
    }
}

struct LargeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VirtualCoinWidgetEntryView(entry: WidgetEntry(date: Date(), viewModels: PreviewData.getWidgetViewModels()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .environment(\.colorScheme, .light)
        }
    }
}
