//
//  UIViewExtension.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/28/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addSubView(subView: UIView) {
        self.addSubview(subView)
        
        var viewConstraintsDict = [String: AnyObject]()
        viewConstraintsDict["subView"] = subView
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[subView]|",
                options: [],
                metrics: nil,
                views: viewConstraintsDict
            )
        )
        
        self.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[subView]|",
                options: [],
                metrics: nil,
                views: viewConstraintsDict
            )
        )
    }
}
