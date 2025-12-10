//
//  Strings.swift
//  MazzApp
//
//  Created by 2171 on 06/12/25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
