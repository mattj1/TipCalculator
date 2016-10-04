//
//  TipCalculatorPresenterImpl.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class TipCalculatorPresenterImpl : TipCalculatorPresenter {
    var total:Float = 0;
    var numberOfPeople:Int = 1;
    var tipPercent:Int = 0;
    
    var tipCalculatorManager:TipCalculatorManager;
    var localeManager:LocaleManager;
    var userPrefs:UserPrefs;
    
    var view:TipCalculatorView?;
    
    init(tipCalculatorManager:TipCalculatorManager, localeManager:LocaleManager, userPrefs:UserPrefs) {
        self.total = 0;
        
        self.userPrefs = userPrefs;
        
        self.numberOfPeople = userPrefs.numberOfPeople();
        self.tipPercent = userPrefs.tipPercent();
        
        self.tipCalculatorManager = tipCalculatorManager;
        self.localeManager = localeManager;
    }
    

    func setView(view:TipCalculatorView) {
        self.view = view;
    }
    
    func viewWillAppear() {
        updateView();
    }
    
    func increaseNumberOfPeople() {
        numberOfPeople = numberOfPeople + 1;
        updateView();
        userPrefs.setNumberOfPeople(value: numberOfPeople);
    }
    
    func decreaseNumberOfPeople() {
        if(numberOfPeople > 1) {
            numberOfPeople = numberOfPeople - 1;
            updateView();
            userPrefs.setNumberOfPeople(value: numberOfPeople);
        }
    }
    
    func increaseTipAmount() {
        tipPercent = tipPercent + 1;
        updateView();
        userPrefs.setTipPercent(value: tipPercent);
    }
    
    func decreaseTipAmount() {
        if(tipPercent > 1) {
            tipPercent = tipPercent - 1;
            updateView()
            userPrefs.setTipPercent(value: tipPercent);
        }
    }
    
    func setTotal(total:String) {
        self.total = localeManager.returnFloatWithoutLocale(value: total);
        
        updateView();
    }
    
    func goToSettings() {
        view?.openSettings();
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
