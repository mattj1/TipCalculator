//
//  SettingsPresenterImpl.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class SettingsPresenterImpl : SettingsPresenter {
    
    var themes: [String] = ["Light", "Dark"]
    
    var localeManager:LocaleManager;
    var userPrefs:UserPrefs;
    
    var view:SettingsView?;
    
    func setView(view:SettingsView) {
        self.view = view;
    }
    
    var themeCells = [SettingsCell]();
    var localeCells = [SettingsCell]();
    
    init(localeManager:LocaleManager, userPrefs:UserPrefs) {
        self.userPrefs = userPrefs;
        self.localeManager = localeManager;
    }
    
    // VERY INEFFICIENT! I'm lazy now...
    func updateCells() {
        themeCells = [SettingsCell]();
        localeCells = [SettingsCell]();
        
        let selectedLocale:Int = userPrefs.getSelectedLocale();
        let selectedTheme:String = userPrefs.getThemeString();
        
        for (index, locale) in self.localeManager.getAllLocales().enumerated() {
            let cell:SettingsCell = SettingsCell();
            cell.caption = localeManager.getLocaleNameForId(localeID:locale);
            cell.selected = index == selectedLocale;
            localeCells.append(cell);
        }
        
        for theme:String in themes {
            let cell:SettingsCell = SettingsCell();
            cell.caption = theme;
            cell.selected = theme.lowercased() == selectedTheme; // hack, but works...
            themeCells.append(cell);
        }
        
        view?.setThemeCells(cells:themeCells);
        view?.setLocaleCells(cells:localeCells);
    }
    
    func viewWillAppear() {
        updateCells();
    }
    
    func selectTheme(index:Int) {
        view?.setTheme(index: index);
        updateCells();
    }
    
    func selectLocale(index:Int) {
        userPrefs.setSelectedLocale(value: index);
        updateCells();
        view?.close();
    }
    
    func goBack() {
        view?.close();
    }
}
