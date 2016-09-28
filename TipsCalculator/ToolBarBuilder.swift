//
//  ToolBarBuilder.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/28/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

class ToolBarBuilder: NSObject {
    class func addToolBar(textView: UITextView, tempSelector: Selector, title: String, responder: NSObject) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        let doneButton:UIBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.done, target: responder, action: tempSelector)
        let spaceButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        textView.inputAccessoryView = toolBar
    }
}
