//
//  ConsoleSettingsView.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class ConsoleSettingsView {
    
    func input() -> String {
        let input = String(
            data: FileHandle.standardInput.availableData,
            encoding: String.Encoding.utf8)
        
        return input!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
    }
    
    required init?() {
        //super.init();
        
        // This should come from application module, or injected into this ViewController...
        
//        self.presenter = TipCalculatorPresenterImpl(tipCalculatorManager: TipCalculatorManager(), localeManager:LocaleManager());
        
//        self.presenter?.view = self;
        
//        self.presenter?.viewDidAppear();
        
        self.userInput();
    }
    
    func userInput() {
        var running:Bool = true;
        
        while(running) {
            print("1. Choose theme");
            print("2. Choose locale");
            print("3. Exit");
            
            print("Input choice: ");
            
            let str = input();
            
            switch(str) {
            case "1":
//                print("Enter new total:");
//                let newTotal = input();
//                presenter?.setTotal(total: newTotal);
                break;
            case "3":
                running = false;
                break;
            default:
                break;
            }
        }
    }
}
