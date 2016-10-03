//
//  MainModule.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class MainModule {
    
    var localeManager:LocaleManager;
    var userPrefs:UserPrefs;
    
    init() {
        // These should be provided by something else.
        userPrefs = UserPrefsUserDefaults();
        localeManager = LocaleManager(userPrefs:userPrefs);
        
    }
    
    func getLocaleManager() -> LocaleManager {
        return localeManager;
    }
    
    func getUserPrefs() -> UserPrefs {
        return userPrefs;
    }
    
    func createTipCalculatorModule() -> TipCalculatorModule {
        return TipCalculatorModule(mainModule:self);
    }
}
