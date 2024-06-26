// Software Name: VCoin
// SPDX-FileCopyrightText: Copyright © 2021 Marcin Czachurski and the repository contributors.
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//

import Foundation

extension Bundle {
    
    var appVersionNumber: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? "<undefined>"
    }
    var buildVersionNumber: String {
        infoDictionary?["CFBundleVersion"] as? String ?? "<undefined>"
    }
}
