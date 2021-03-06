//
//  UserPrefsUserDefaults.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

let selectedLocaleKey: String = "selectedLocale"
let numberOfPeopleKey = "numberOfPeople"
let tipPercentageKey = "tipPercentage"
let themeKey = "themeKey"
let lastUsed = "lastUsed"

// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html

class UserPrefsUserDefaults : UserPrefs {
    
    func numberOfPeople() -> Int {
        var value:Int = UserDefaults.standard.integer(forKey: numberOfPeopleKey);
        if(value < 1)  {
            value = 1;
        }
        return value;
    }
    
    func setNumberOfPeople(value:Int) {
        UserDefaults.standard.set(value, forKey: numberOfPeopleKey)
    }
    
    func tipPercent() -> Int {
        var value:Int = UserDefaults.standard.integer(forKey: tipPercentageKey);
        if(value < 0) {
            value = 0;
        }
        return value;
    }
    
    func setTipPercent(value:Int) {
        UserDefaults.standard.set(value, forKey: tipPercentageKey)
    }
    
    func getSelectedLocale() -> Int {
        if (UserDefaults.standard.object(forKey: selectedLocaleKey) != nil) {
            return UserDefaults.standard.object(forKey: selectedLocaleKey) as! Int
        }
        
        return 0
    }
    
    func setSelectedLocale(value:Int) {
        UserDefaults.standard.set(value, forKey: selectedLocaleKey);
        
        /*let selectedLocale: Int
        if UserDefaults.standard.object(forKey: selectedLocaleKey) != nil {
            selectedLocale = UserDefaults.standard.object(forKey: selectedLocaleKey) as! Int
        } else {
            selectedLocale = 0
        }*/
    }
    
    func getThemeString() -> String {
        var themeString:String? = UserDefaults.standard.string(forKey: themeKey);
        if(themeString == nil) {
            themeString = "light";
        }
        
        return themeString!;
    }
    
    func setThemeString(themeString:String) {
        UserDefaults.standard.set(themeString, forKey: themeKey)
    }
    
    
    func getLastUsed() -> Date? {
        let obj = UserDefaults.standard.object(forKey: lastUsed);
        if(obj != nil) {
            return obj as? Date;
        }
        
        return nil;
    }
    
    func setLastUsed(date:Date) {
        UserDefaults.standard.set(Date(), forKey: lastUsed);
    }
}
