//
//  ToolbarLayoutHelper.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/15/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class ToolbarLayoutHelper {
    static func makeToolbar(_ view: UIView) -> UIToolbar {
        let tb = UIToolbar()
        tb.isTranslucent = true
        tb.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tb)
        let constraints = makeToolbarConstraints(tb)
        view.addConstraints(constraints)
        return tb
    }
    
    static func makeToolbarConstraints(_ toolbar: UIToolbar) -> [NSLayoutConstraint] {
        return [
            toolbar.pinToLeft(),
            toolbar.pinToRight(),
            toolbar.wrapInHeight(49),
            toolbar.pinToBottom()
        ]
    }
}
