//
//  MainModule.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class MainModule {
    
    private(set) var localeManager:LocaleManager;
    private(set) var userPrefs:UserPrefs;
    
    init(componentProvider:ComponentProvider) {
        // These should be provided by something else.
        userPrefs = componentProvider.provideUserPrefs();
        localeManager = LocaleManager(userPrefs:userPrefs);
        
        // Init stuff
        
        let lastUsed:Date? = userPrefs.getLastUsed()
        if (lastUsed != nil) {
            
            let elapsedTime: TimeInterval = lastUsed!.timeIntervalSince(Date())
            if (elapsedTime > 1800) {
                
                userPrefs.setNumberOfPeople(value: 1);
                userPrefs.setTipPercent(value: 0)
            }
        }
    }
    
    func createTipCalculatorModule() -> TipCalculatorModule {
        return TipCalculatorModule(mainModule:self);
    }
}
