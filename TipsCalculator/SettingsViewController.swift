//
//  SettingsViewController.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/18/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

let selectedLocaleKey: String = "selectedLocale"
let notificationUpdatedLocale: String = "updatedLocale"

protocol SettingsProtocol {
    var selectedLocale: Int{ get }
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var localeTableView: UITableView?
    var selectedLocale: Int = 0
    
    
    override func viewDidLoad() {
        localeTableView?.delegate = self
        localeTableView?.dataSource = self
        selectedLocale = UserDefaults.standard.integer(forKey: selectedLocaleKey)
        self.title = "Settings"
    }
}

//UITableView Delegate Methods
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tempIndexPath: IndexPath = IndexPath(row: selectedLocale, section: 0)
        if let unselectedCell: UITableViewCell = tableView.cellForRow(at: tempIndexPath) {
            unselectedCell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.setSelected(true, animated: true)
        selectedCell.accessoryType = UITableViewCellAccessoryType.checkmark
        UserDefaults.standard.set(indexPath.row, forKey: selectedLocaleKey)
        
        NotificationCenter.default.post(Notification(name: Notification.Name(notificationUpdatedLocale), object: Int(indexPath.row)))
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDataSource {
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Country"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let onDemandCell: UITableViewCell = UITableViewCell()
        
        
        if indexPath.row == selectedLocale {
            onDemandCell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            onDemandCell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        
        let localeName: String = LocaleManager.sharedInstace.identifiersArray[indexPath.row]
        onDemandCell.textLabel?.text = LocaleManager.sharedInstace.localeDictionary[localeName]
        
        
        return onDemandCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocaleManager.sharedInstace.identifiersArray.count
    }
}

//UI Events
extension SettingsViewController {
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
