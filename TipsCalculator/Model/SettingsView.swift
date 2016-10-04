//
//  SettingsView.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
protocol SettingsView {
    func setTheme(index:Int);
    
    func close();
    
    func setThemeCells(cells:[SettingsCell]);
    func setLocaleCells(cells:[SettingsCell]);
    
}
