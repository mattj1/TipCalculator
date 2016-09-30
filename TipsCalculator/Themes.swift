//
//  Themes.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/28/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

let themeKey = "themeKey"

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
    
    static func themeLight() {
        calculatorBackgroundColor = UIColor.white
        calculatorFontColor = UIColor.blue
        tipControlsBackgroundColor = UIColor.white
        tipControlsFontColor = UIColor.blue
        settingsTableBackgroundColor = UIColor.white
        settingsTableFontColor = UIColor.blue
        settingsHeaderBackgroundColor = UIColor(red: 60.0/255.0, green: 90.0/255.0, blue: 230.0/255.0, alpha: 0.8)
        toolBarButtonTintColor = UIColor(red: 60.0/255.0, green: 90.0/255.0, blue: 230.0/255.0, alpha: 0.8)
        settingsHeaderFontColor = UIColor.white
        self.saveThemeWithValue(theme: ThemeEnum.Light)
        themeValue = 0
    }
    
    static func themeDark() {
        calculatorBackgroundColor = UIColor.darkGray
        calculatorFontColor = UIColor.white
        tipControlsBackgroundColor = UIColor.lightGray
        tipControlsFontColor = UIColor.white
        settingsTableBackgroundColor = UIColor.black
        settingsTableFontColor = UIColor.lightGray
        settingsHeaderBackgroundColor = UIColor.darkGray
        toolBarButtonTintColor = UIColor.black
        settingsHeaderFontColor = UIColor.white
        self.saveThemeWithValue(theme: ThemeEnum.Dark)
        themeValue = 1
    }
    
    static func saveThemeWithValue(theme: ThemeEnum) {
        let themeString: String?
        if theme == ThemeEnum.Dark {
            themeString = "dark"
        } else {
            themeString = "light"
        }
        UserDefaults.standard.set(themeString, forKey: themeKey)
    }
    
    static func startTheme() {
        if UserDefaults.standard.object(forKey: themeKey) == nil || UserDefaults.standard.object(forKey: themeKey) as! String == "light" {
            self.themeLight()
        } else {
            self.themeDark()
        }
    }
}
