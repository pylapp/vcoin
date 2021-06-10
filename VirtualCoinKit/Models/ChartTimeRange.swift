//
//  https://mczachurski.dev
//  Copyright © 2021 Marcin Czachurski. All rights reserved.
//

import Foundation

public enum ChartTimeRange: String {
    case hour = "Hour", day = "Day", week = "Week", month = "Month", year = "Year"

    public static let allValues = [hour, day, week, month, year]
}
