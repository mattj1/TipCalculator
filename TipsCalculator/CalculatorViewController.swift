//
//  CalculatorViewController.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/11/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

//Initialization and ViewController Life Cycle Methods
class CalculatorViewController: UIViewController {
    @IBOutlet weak var percentageLabel: UILabel?
    @IBOutlet weak var numberOfPeopleLabel: UILabel?
    @IBOutlet weak var paymentPerPersonLabel: UILabel?
    @IBOutlet weak var tipTotalLabel: UILabel?
    @IBOutlet weak var tipPercentageTitle: UILabel?
    @IBOutlet weak var tipAmountTitle: UILabel?
    @IBOutlet weak var amountPerPersonTitle: UILabel?
    @IBOutlet weak var numberOfPeopleTitle: UILabel?
    
    var currentTotalValue: String = "0.00"
    
    var presenter:TipCalculatorPresenter?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.backgroundColor = Theme.tipControlsBackgroundColor
        tipTotalLabel?.textColor = Theme.tipControlsFontColor
        tipAmountTitle?.textColor = Theme.tipControlsFontColor
        tipPercentageTitle?.textColor = Theme.tipControlsFontColor
        numberOfPeopleLabel?.textColor = Theme.tipControlsFontColor
        numberOfPeopleTitle?.textColor = Theme.tipControlsFontColor
        amountPerPersonTitle?.textColor = Theme.tipControlsFontColor
        paymentPerPersonLabel?.textColor = Theme.tipControlsFontColor
        percentageLabel?.textColor = Theme.tipControlsFontColor
        
        self.presenter?.viewWillAppear();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func updateView(tipPercentage:String, numPeople:String, tipAmount:String, amountPerson:String) {
        percentageLabel?.text = tipPercentage;
        numberOfPeopleLabel?.text = numPeople;
        tipTotalLabel?.text = tipAmount;
        paymentPerPersonLabel?.text = amountPerson;
    }
}

//UI Events
extension CalculatorViewController {
    @IBAction func increaseNumberOfPeople(sender: UIButton) {
        self.presenter?.increaseNumberOfPeople();
    }
    
    @IBAction func decreaseNumberOfPeople(sender: UIButton) {
        self.presenter?.decreaseNumberOfPeople();
    }
    
    @IBAction func increaseTipPercentage(sender: UIButton) {
        self.presenter?.increaseTipAmount();
    }
    
    @IBAction func decreaseTipPercentage(sender: UIButton) {
        self.presenter?.decreaseTipAmount();
    }
}

