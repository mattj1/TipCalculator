//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/10/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import UIKit
import Foundation

let notificationTotalUpdated: String = "totalUpdatedNotification"

//View Controller Life Cycle and Initialization Methods
class ViewController: UIViewController {
    @IBOutlet weak var totalConsumeLabel: UITextView?
    @IBOutlet var verticalConstraintConsumeLabel: NSLayoutConstraint?
    @IBOutlet weak var containerView: UIView?
    weak var calculatorVC: CalculatorViewController?
    weak var settingsVC: SettingsViewController?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector:#selector(formatLocale) , name: NSNotification.Name(rawValue: notificationUpdatedLocale), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(makeTextViewFirstResponder), name: NSNotification.Name.UIApplicationDidBecomeActive , object: nil)
        self.calculatorVC = self.storyboard?.instantiateViewController(withIdentifier: "calculatorFrame") as? CalculatorViewController
        self.calculatorVC?.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.calculatorVC!)
        self.addSubView(subView: (self.calculatorVC?.view)!, toView:self.containerView!)
        self.addToolBar(textView: self.totalConsumeLabel!)
        super.viewDidLoad()
        totalConsumeLabel?.textContainer.maximumNumberOfLines = 1
        totalConsumeLabel?.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
        totalConsumeLabel?.keyboardType = UIKeyboardType.decimalPad
        totalConsumeLabel?.delegate = self
        totalConsumeLabel?.text = LocaleManager.sharedInstace.formatLocale(value: (totalConsumeLabel?.text)!, locale: self.selectedLocale)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        totalConsumeLabel?.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: SettingsProtocol {
    var selectedLocale: Int {
        return UserDefaults.standard.object(forKey: selectedLocaleKey) as! Int
    }
}

//UITextView Delegate Methods
extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.view.layoutIfNeeded()
        textView.text = ""
        let padding: CGFloat = CGFloat(30.0)
        self.verticalConstraintConsumeLabel?.constant = -1 * (((self.totalConsumeLabel?.frame.minY)! - (self.navigationController?.navigationBar.frame.height)!) - padding)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            }, completion: { (completed: Bool) in
                
        })
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.layoutIfNeeded()
        self.verticalConstraintConsumeLabel?.constant = 0
        NotificationCenter.default.post(Notification(name: Notification.Name(notificationTotalUpdated), object: self.totalConsumeLabel?.text, userInfo: nil))
        totalConsumeLabel?.text = LocaleManager.sharedInstace.formatLocale(value: (totalConsumeLabel?.text)!, locale: self.selectedLocale)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            }, completion: { (completed: Bool) in
                
        })
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    func makeTextViewFirstResponder() {
        totalConsumeLabel?.becomeFirstResponder()
    }
}

//Custom UI Methods
extension ViewController {
    func donePressed() {
        self.totalConsumeLabel?.resignFirstResponder()
    }
}

//Convenience methods
extension ViewController {
    func formatLocale() {
        totalConsumeLabel?.text = LocaleManager.sharedInstace.formatLocale(value: (totalConsumeLabel?.text)!, locale: self.selectedLocale)
    }
    
    func addSubView(subView: UIView, toView parentView: UIView) {
        parentView.addSubview(subView)
        
        var viewConstraintsDict = [String: AnyObject]()
        viewConstraintsDict["subView"] = subView
        parentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[subView]|",
            options: [],
            metrics: nil,
            views: viewConstraintsDict
            )
        )
        
        parentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[subView]|",
                options: [],
                metrics: nil,
                views: viewConstraintsDict
            )
        )
    }
    
    func addToolBar(textView: UITextView) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        let doneButton:UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.donePressed))
        let spaceButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        textView.inputAccessoryView = toolBar
    }
}

