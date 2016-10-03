//
//  TipCalculatorModule.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class TipCalculatorModule {
    
    private var _presenter : TipCalculatorPresenterImpl;

    var presenter:TipCalculatorPresenterImpl {
        get { return _presenter; }
    }
    
    init(mainModule:MainModule) {
        _presenter = TipCalculatorPresenterImpl(tipCalculatorManager: TipCalculatorManager(),
                                                localeManager:mainModule.getLocaleManager(),
                                                userPrefs:mainModule.getUserPrefs());
    }
}
