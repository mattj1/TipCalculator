//
//  ConsoleSettingsView.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class ConsoleSettingsView : SettingsView {
    
    var themeCells = [SettingsCell]();
    var localeCells = [SettingsCell]();

    var running:Bool = true;
    
    internal func close() {
        running = false;
    }

    internal func setTheme(index: Int) {
        print("set theme: \(index)");
    }

    
    var presenter:SettingsPresenter?;
    
    func input() -> String {
        let input = String(
            data: FileHandle.standardInput.availableData,
            encoding: String.Encoding.utf8)
        
        return input!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
    }
    
    required init?() {
        //super.init();
        
        // This should come from application module, or injected into this ViewController...
        
        //self.userPrefs = appDelegate.mainModule().getUserPrefs();
        self.presenter = SettingsPresenterImpl(localeManager:mainModule.getLocaleManager(), userPrefs:mainModule.getUserPrefs());
        
        self.presenter?.setView(view: self);
        
//        self.presenter = TipCalculatorPresenterImpl(tipCalculatorManager: TipCalculatorManager(), localeManager:LocaleManager());
        
//        self.presenter?.view = self;
        
        self.presenter?.viewWillAppear();
        
        self.userInput();
    }
    
    func userInput() {
        
        
        while(running) {
            print("1. Choose theme");
            print("2. Choose locale");
            print("3. Exit");
            
            print("Input choice: ");
            
            let str = input();
            
            switch(str) {
            case "1":
                chooseTheme();
                break;
            case "2":
                chooseLocale();
                break;
            case "3":
                running = false;
                break;
            default:
                break;
            }
        }
    }
    
    func getListChoice(cells:[SettingsCell]) -> Int {
        var i:Int = 0;
        for cell in cells {
            print(String(format:"%d. %@ %@", i + 1, cell.caption, cell.selected ? "<-- SELECTED" : ""))
            i = i + 1;
        }
        
        print(String(format:"%d. Back", i + 1));
            
        while(true) {
            print("Input choice: ");
            let v:Int = Int(input())!;
            
            print("chose: \(v)");
            
            if(v >= 1 && v <= i + 1) {
                if(v == i + 1) {
                    return -1
                }
                
                return v - 1;
            }
            
        }
        
        
    }
    func chooseTheme() {
        
        // Settings stuff for themes needs to be moved out of Themes.swift
        print(" ** CURRENTLY NOT WORKING **");
        
        let i:Int = getListChoice(cells: themeCells);
        if(i == -1) {
            return;
        }
        
        presenter?.selectTheme(index: i);
    }
    
    func chooseLocale() {
        let i:Int = getListChoice(cells: localeCells);
        if(i == -1) {
            return;
        }
        
        presenter?.selectLocale(index: i);
    }
    
    func setThemeCells(cells:[SettingsCell]) {
        themeCells = cells;
    }
    
    func setLocaleCells(cells:[SettingsCell]) {
        localeCells = cells;
    }
    
}
