//
//  TipCalculatorPresenter.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/3/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

protocol TipCalculatorPresenter {
    func setView(view:TipCalculatorView);
    
    func viewWillAppear();
    
    func increaseNumberOfPeople();
    func decreaseNumberOfPeople();

    func increaseTipAmount();
    func decreaseTipAmount();
    
    func setTotal(total:String);
    
    func goToSettings();
}
