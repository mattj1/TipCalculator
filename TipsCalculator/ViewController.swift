//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/10/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import UIKit

//View Controller Life Cycle and Initialization Methods
class ViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar?
    @IBOutlet weak var totalConsumeLabel: UITextView?
    @IBOutlet var verticalConstraintConsumeLabel: NSLayoutConstraint?
    @IBOutlet weak var containerView: UIView?
    weak var calculatorVC: UIViewController?
    
    //required init?(coder aDecoder: NSCoder) {
    //    super.init(coder: aDecoder)
    //}
    
    override func viewDidLoad() {
        
        self.containerView?.layer.borderColor = UIColor.red.cgColor
        self.containerView?.layer.borderWidth = 1.0
        self.calculatorVC = self.storyboard?.instantiateViewController(withIdentifier: "calculatorFrame") as! CalculatorViewController
        self.calculatorVC?.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.calculatorVC!)
        self.addSubView(subView: (self.calculatorVC?.view)!, toView:self.containerView!)
        self.addToolBar(textView: self.totalConsumeLabel!)
        super.viewDidLoad()
        totalConsumeLabel?.textContainer.maximumNumberOfLines = 1
        totalConsumeLabel?.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
        totalConsumeLabel?.keyboardType = UIKeyboardType.decimalPad
        totalConsumeLabel?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//UITextView Delegate Methods
extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.view.layoutIfNeeded()
        self.totalConsumeLabel?.text = "$"
        self.verticalConstraintConsumeLabel?.constant = -1 * ((self.totalConsumeLabel?.frame.minY)! - (self.navigationBar?.frame.height)!)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            }, completion: { (completed: Bool) in
                
        })
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.layoutIfNeeded()
        self.verticalConstraintConsumeLabel?.constant = 0
        
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
}

//Custom UI Methods
extension ViewController {
    func donePressed() {
        self.totalConsumeLabel?.resignFirstResponder()
    }
}

//Convenience methods
extension ViewController {
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

