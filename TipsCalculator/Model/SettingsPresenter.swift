//
//  SettingsPresenter.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class SettingsCell {
    var caption:String = "";
    var selected:Bool = false;
}

protocol SettingsPresenter {
    
    func viewWillAppear();
    
    func selectTheme(index:Int);
    func selectLocale(index:Int);
    
    func goBack();
    
    func setView(view:SettingsView);
}
