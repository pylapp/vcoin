//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski. All rights reserved.
//

import WidgetKit
import SwiftUI
import LightChart
import VirtualCoinKit

struct MediumWidgetView: View {
    var viewModels: [WidgetViewModel]
    
    @Setting(\.currency) private var currencySymbol: String

    var body: some View {
        VStack {
            ForEach(viewModels.prefix(3).indices, id: \.self) { index in
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(viewModels[index].name)")
                                .font(.caption2)
                            Text("\(viewModels[index].symbol)")
                                .foregroundColor(Color.gray)
                                .font(.caption2)
                        }

                        Spacer()
                        
                        LightChartView(data: viewModels[index].chart,
                                       type: .curved,
                                       visualType: viewModels[index].changePercent24Hr > 0 ? .green : .red,
                                       currentValueLineType: viewModels[index].changePercent24Hr > 0 ? .green : .red)
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
                
                    if index + 1 < (viewModels.capacity > 3 ? 3 : viewModels.capacity) {
                        Divider()
                    }
                }
            }
        }
        .padding()
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {            
            VirtualCoinWidgetEntryView(entry: WidgetEntry(date: Date(), viewModels: PreviewData.getWidgetViewModels()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .environment(\.colorScheme, .light)
        }
    }
}
