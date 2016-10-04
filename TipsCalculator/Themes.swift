//
//  Themes.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/28/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    static var calculatorBackgroundColor = UIColor.white
    static var calculatorFontColor = UIColor.blue
    static var tipControlsBackgroundColor = UIColor.white
    static var tipControlsFontColor = UIColor.blue
    static var settingsTableBackgroundColor = UIColor.white
    static var settingsTableFontColor = UIColor.blue
    static var settingsHeaderBackgroundColor = UIColor.darkGray
    static var settingsHeaderFontColor = UIColor.white
    static var toolBarButtonTintColor = UIColor.blue
    static var themeValue: Int = 0
    
    static func themeLight(userPrefs:UserPrefs) {
        calculatorBackgroundColor = UIColor.white
        calculatorFontColor = UIColor.blue
        tipControlsBackgroundColor = UIColor.white
        tipControlsFontColor = UIColor.blue
        settingsTableBackgroundColor = UIColor.white
        settingsTableFontColor = UIColor.blue
        settingsHeaderBackgroundColor = UIColor(red: 60.0/255.0, green: 90.0/255.0, blue: 230.0/255.0, alpha: 0.8)
        toolBarButtonTintColor = UIColor(red: 60.0/255.0, green: 90.0/255.0, blue: 230.0/255.0, alpha: 0.8)
        settingsHeaderFontColor = UIColor.white
        self.saveThemeWithValue(userPrefs:userPrefs, theme: ThemeEnum.Light)
        themeValue = 0
    }
    
    static func themeDark(userPrefs:UserPrefs) {
        calculatorBackgroundColor = UIColor.darkGray
        calculatorFontColor = UIColor.white
        tipControlsBackgroundColor = UIColor.lightGray
        tipControlsFontColor = UIColor.white
        settingsTableBackgroundColor = UIColor.black
        settingsTableFontColor = UIColor.lightGray
        settingsHeaderBackgroundColor = UIColor.darkGray
        toolBarButtonTintColor = UIColor.black
        settingsHeaderFontColor = UIColor.white
        self.saveThemeWithValue(userPrefs:userPrefs, theme: ThemeEnum.Dark)
        themeValue = 1
    }
    
    static func saveThemeWithValue(userPrefs:UserPrefs, theme: ThemeEnum) {
        let themeString: String?
        if theme == ThemeEnum.Dark {
            themeString = "dark"
        } else {
            themeString = "light"
        }
        
        userPrefs.setThemeString(themeString:themeString!);
    }
    
    static func startTheme(userPrefs:UserPrefs) {
        if userPrefs.getThemeString() == "light" {
            self.themeLight(userPrefs:userPrefs)
        } else {
            self.themeDark(userPrefs:userPrefs)
        }
    }
}
