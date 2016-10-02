//
//  TipCalculatorManager.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/19/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class TipCalculatorManager {
    
    init() {
        
    }
    
    class func calculateIndividualPayment(total: Float, percentage: Int, people: Int) -> Float {
        let percentageFraction: Float = Float(Float(percentage) / 100.0)
        return Float((total * percentageFraction) / Float(people))
    }
    
    class func calculateTotalTip(total: Float, percentage: Int) -> Float {
        return Float(total * Float(Float(percentage) / 100.0))
    }
}
