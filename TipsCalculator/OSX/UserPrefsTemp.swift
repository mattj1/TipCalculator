//
//  File.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/3/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class UserPrefsTemp : UserPrefs {
    
    var _numberOfPeople:Int = 0;
    
    func numberOfPeople() -> Int {
        return _numberOfPeople;
    }
    
    func setNumberOfPeople(value:Int) {
        _numberOfPeople = value;
    }
    
    func tipPercent() -> Int {
        return 0;
    }
    
    func setTipPercent(value:Int) {
        
    }
    
    func getSelectedLocale() -> Int {
        return 0;
    }
    
    func setSelectedLocale(value:Int) {
        
    }
    
    func getThemeString() -> String {
        return "light"
    }
    
    func setThemeString(themeString:String) {
        
    }
    
    func getLastUsed() -> Date? {
        return nil;
    }
    
    func setLastUsed(date:Date) {
        
    }
}
