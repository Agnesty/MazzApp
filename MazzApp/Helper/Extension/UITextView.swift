//
//  UITextView.swift
//  MazzApp
//
//  Created by 2171 on 06/12/25.
//

import SwiftUI

extension UITextView {
    open override var inputAssistantItem: UITextInputAssistantItem {
        let item = super.inputAssistantItem
        item.leadingBarButtonGroups = []
        item.trailingBarButtonGroups = []
        return item
    }
}
