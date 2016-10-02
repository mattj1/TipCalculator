//
//  TipCalculatorPresenterImpl.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

// TODO: Move these to a user prefs manager
let numberOfPeopleKey = "numberOfPeople"
let tipPercentageKey = "tipPercentage"

class TipCalculatorPresenterImpl {
    var total:Float = 0;
    var numberOfPeople:Int = 1;
    var tipPercent:Int = 0;
    
    var tipCalculatorManager:TipCalculatorManager;
    var localeManager:LocaleManager;
    
    var view:TipCalculatorView?;
    

    init(tipCalculatorManager:TipCalculatorManager, localeManager:LocaleManager) {
        self.total = 0;
        self.numberOfPeople = 1;
        self.tipPercent = 0;
        
        self.tipCalculatorManager = tipCalculatorManager;
        self.localeManager = localeManager;
    }
    

    func setView(view:TipCalculatorView) {
        self.view = view;
    }
    
    func viewDidAppear() {
        updateView();
    }
    
    func increaseNumberOfPeople() {
        numberOfPeople = numberOfPeople + 1;
        updateView();
        UserDefaults.standard.set(numberOfPeople, forKey: numberOfPeopleKey)
    }
    
    func decreaseNumberOfPeople() {
        if(numberOfPeople > 1) {
            numberOfPeople = numberOfPeople - 1;
            updateView();
            UserDefaults.standard.set(numberOfPeople, forKey: numberOfPeopleKey)
        }
    }
    
    func increaseTipAmount() {
        tipPercent = tipPercent + 1;
        updateView();
        UserDefaults.standard.set(tipPercent, forKey: tipPercentageKey)
    }
    
    func decreaseTipAmount() {
        if(tipPercent > 1) {
            tipPercent = tipPercent - 1;
            updateView()
            UserDefaults.standard.set(tipPercent, forKey: tipPercentageKey)
        }
    }
    
    func setTotal(total:String) {
        self.total = localeManager.returnFloatWithoutLocale(value: total);
        
        updateView();
    }
    
    private func updateView() {
        
        let totalTipFloat:Float = TipCalculatorManager.calculateTotalTip(total: total, percentage: tipPercent);
        let amountPersonFloat:Float = TipCalculatorManager.calculateIndividualPayment(total: total, percentage: tipPercent, people: numberOfPeople);
        
        view?.updateView(
            total: self.localeManager.formatLocale(value: String(total)),
            tipPercentage: "%\(tipPercent)",
            numPeople: "\(numberOfPeople)",
            tipAmount: localeManager.formatLocale(value: String(format: "%.2f", totalTipFloat)),
            amountPerson: localeManager.formatLocale(value: String(format: "%.2f", amountPersonFloat)));
    }
}
