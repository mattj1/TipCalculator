//
//  TipCalculatorView.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

protocol TipCalculatorView {
    func updateView(total:String, tipPercentage:String, numPeople:String, tipAmount:String, amountPerson:String);
    func openSettings();
}
