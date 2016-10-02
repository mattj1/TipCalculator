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
    
    var presenter:TipCalculatorPresenterImpl?; // TODO
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(formatLocale), name: NSNotification.Name(rawValue: notificationUpdatedLocale), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(totalUpdatedWithValue(notification:)), name: NSNotification.Name(rawValue: notificationTotalUpdated), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        numberOfPeopleLabel?.text = UserDefaults.standard.object(forKey: numberOfPeopleKey) != nil ? String(describing: UserDefaults.standard.object(forKey: numberOfPeopleKey)!) : "1"
        percentageLabel?.text = UserDefaults.standard.object(forKey: tipPercentageKey) != nil ? "\(String(describing: UserDefaults.standard.object(forKey: tipPercentageKey)!))%" : "0%"
        self.updateValuesForUIEvent(totalString: self.currentTotalValue)
        
//        paymentPerPersonLabel?.text = LocaleManager.sharedInstace.formatLocale(value: (paymentPerPersonLabel?.text)!, locale: Locale.availableIdentifiers[self.selectedLocale])
        
//        tipTotalLabel?.text = LocaleManager.sharedInstace.formatLocale(value: (tipTotalLabel?.text)!, locale: Locale.availableIdentifiers[self.selectedLocale])
        
        self.view.backgroundColor = Theme.tipControlsBackgroundColor
        tipTotalLabel?.textColor = Theme.tipControlsFontColor
        tipAmountTitle?.textColor = Theme.tipControlsFontColor
        tipPercentageTitle?.textColor = Theme.tipControlsFontColor
        numberOfPeopleLabel?.textColor = Theme.tipControlsFontColor
        numberOfPeopleTitle?.textColor = Theme.tipControlsFontColor
        amountPerPersonTitle?.textColor = Theme.tipControlsFontColor
        paymentPerPersonLabel?.textColor = Theme.tipControlsFontColor
        percentageLabel?.textColor = Theme.tipControlsFontColor
        
        self.presenter?.viewDidAppear();
        
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
        
        /*
        var numberOfPeople: Int = Int((numberOfPeopleLabel?.text)!)!
        numberOfPeople = numberOfPeople + 1
        numberOfPeopleLabel?.text = "\(numberOfPeople)"
        self.updateValuesForUIEvent(totalString: self.currentTotalValue)
        */
    }
    
    @IBAction func decreaseNumberOfPeople(sender: UIButton) {
        
        self.presenter?.decreaseNumberOfPeople();
        /*
        var numberOfPeople: Int = Int((numberOfPeopleLabel?.text)!)!
        
        if ( numberOfPeople > 1 ) {
            numberOfPeople = numberOfPeople - 1
            numberOfPeopleLabel?.text = "\(numberOfPeople)"
            self.updateValuesForUIEvent(totalString: self.currentTotalValue)
            
        }*/
    }
    
    @IBAction func increaseTipPercentage(sender: UIButton) {
        
        self.presenter?.increaseTipAmount();
        
        /*
        let tipPercentStrippedString: String = (percentageLabel?.text?.replacingOccurrences(of: "%", with: ""))!
        var tipPercent: Int = Int(tipPercentStrippedString)!
        tipPercent = tipPercent + 1
        percentageLabel?.text = "%\(tipPercent)"
        self.updateValuesForUIEvent(totalString: self.currentTotalValue)
        */
    }
    
    @IBAction func decreaseTipPercentage(sender: UIButton) {
        self.presenter?.decreaseTipAmount();
        
        /*
        let tipPercentStrippedString: String = (percentageLabel?.text?.replacingOccurrences(of: "%", with: ""))!
        var tipPercent: Int = Int(tipPercentStrippedString)!
        
        if  ( tipPercent > 0 ) {
            tipPercent = tipPercent - 1
            percentageLabel?.text = "%\(tipPercent)"
            self.updateValuesForUIEvent(totalString: self.currentTotalValue)
            UserDefaults.standard.set(tipPercent, forKey: tipPercentageKey)
        }
 */
    }
}

extension CalculatorViewController {
    func updateValuesForUIEvent(totalString: String) {
    /*
        self.currentTotalValue = totalString
    
        let totalNumeric: Float = LocaleManager.sharedInstace.returnFloatWithoutLocale(value: totalString)
        
        let percentageNumeric: Int = Int((percentageLabel?.text?.replacingOccurrences(of: "%", with: ""))!)!
        
        let totalTipFloat: Float = TipCalculatorManager.calculateIndividualPayment(total: totalNumeric, percentage: percentageNumeric, people:Int( (numberOfPeopleLabel?.text)!)!)
        let perPersonTipFloat: Float = TipCalculatorManager.calculateTotalTip(total: totalNumeric, percentage: percentageNumeric)
        
        tipTotalLabel?.text = LocaleManager.sharedInstace.formatLocale(value: String(format: "%.2f", perPersonTipFloat), locale: Locale.availableIdentifiers[selectedLocale])
        
        paymentPerPersonLabel?.text = LocaleManager.sharedInstace.formatLocale(value: String(format: "%.2f", totalTipFloat), locale: Locale.availableIdentifiers[selectedLocale])
 */
 }
}

//Notifications observers
extension CalculatorViewController {
    func totalUpdatedWithValue(notification: Notification) {
        let totalString: String = notification.object as! String
        self.updateValuesForUIEvent(totalString: totalString)
    }
    
    func formatLocale() {
       // paymentPerPersonLabel?.text = LocaleManager.sharedInstace.formatLocale(value: (paymentPerPersonLabel?.text)!, locale: Locale.availableIdentifiers[self.selectedLocale])
       // tipTotalLabel?.text = LocaleManager.sharedInstace.formatLocale(value: (tipTotalLabel?.text)!, locale: Locale.availableIdentifiers[self.selectedLocale])
    }
}

