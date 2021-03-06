//
//  ConsoleTipCalculatorView.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Cocoa
import Foundation

class ConsoleTipCalculatorView : TipCalculatorView {
    
    var presenter:TipCalculatorPresenter?;
    
    required init?(tipCalculatorModule:TipCalculatorModule) {
        //super.init();
        
        // This should come from application module, or injected into this ViewController...
        
        self.presenter = tipCalculatorModule.presenter;
        
        self.presenter?.setView(view: self);
        
        self.presenter?.viewWillAppear();
        
        self.userInput();
    }
    
    func updateView(total:String, tipPercentage:String, numPeople:String, tipAmount:String, amountPerson:String) {
        
        print("Tip Calculator");
        print("--------------");
        print("");
        print("Total: \(total)");
        print("Tip %: \(tipPercentage)");
        print("Number of people: \(numPeople)");
        print("Tip amount: \(tipAmount)");
        print("Amount per person: \(amountPerson)");
        print("");
    }
    
    func userInput() {
        var running:Bool = true;
        
        while(running) {
            print("1. Enter total");
            print("2. Increase tip %");
            print("3. Decrease tip %");
            print("4. Increase number of people");
            print("5. Decrease number of people");
            print("6. Go to Settings");
            print("7. Exit");
            
            print("Input choice: ");

            let str = input();

            switch(str) {
                case "1":
                    print("Enter new total:");
                    let newTotal = input();
                    presenter?.setTotal(total: newTotal);
                    break;
                case "2":
                    presenter?.increaseTipAmount();
                    break;
                case "3":
                    presenter?.decreaseTipAmount();
                    break;
                case "4":
                    presenter?.increaseNumberOfPeople();
                    break;
                case "5":
                    presenter?.decreaseNumberOfPeople();
                    break;
                case "6":
                    presenter?.goToSettings();
                    break;
                case "7":
                    running = false;
                    break;
                
                
            default:
                break;
            }
        }
    }
    
    internal func openSettings() {
        ConsoleSettingsView();
    }
}
