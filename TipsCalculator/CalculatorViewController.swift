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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

//UI Events
extension CalculatorViewController {
    @IBAction func increaseNumberOfPeople(sender: UIButton) {
        var numberOfPeople: Int = Int((numberOfPeopleLabel?.text)!)!
        numberOfPeople = numberOfPeople + 1
        numberOfPeopleLabel?.text = "\(numberOfPeople)"
    }
    
    @IBAction func decreaseNumberOfPeople(sender: UIButton) {
        var numberOfPeople: Int = Int((numberOfPeopleLabel?.text)!)!
        if (numberOfPeople > 1) {
            numberOfPeople = numberOfPeople - 1
            numberOfPeopleLabel?.text = "\(numberOfPeople)"
        }
    }
    
    @IBAction func increaseTipPercentage(sender: UIButton) {
        var tipPercent: Int = Int((tipTotalLabel?.text)!)!
        tipPercent = tipPercent + 1
        tipTotalLabel?.text = "%\(tipPercent)"
    }
    
    @IBAction func decreaseTipPercentage(sender: UIButton) {
        var tipPercent: Int = Int((tipTotalLabel?.text)!)!
        if  (tipPercent > 0) {
            tipPercent = tipPercent - 1
            tipTotalLabel?.text = "%\(tipPercent)"
        }
    }
}
