//
//  UserPrefs.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

protocol UserPrefs {
    func numberOfPeople() -> Int;
    func setNumberOfPeople(value:Int);
    
    func tipPercent() -> Int;
    func setTipPercent(value:Int);
    
    func getSelectedLocale() -> Int;
    func setSelectedLocale(value:Int);
    
    func getThemeString() -> String;
    func setThemeString(themeString:String);
}
