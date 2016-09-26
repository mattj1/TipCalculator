//
//  SettingsDataManager.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/25/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

class SettingsDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
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
        
        let selectedLocale: Int
        if UserDefaults.standard.object(forKey: selectedLocaleKey) != nil {
            selectedLocale = UserDefaults.standard.object(forKey: selectedLocaleKey) as! Int
        } else {
            selectedLocale = 0
        }
        
        if indexPath.row == selectedLocale {
            onDemandCell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            onDemandCell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        
        let localeName: String = NSLocale.availableLocaleIdentifiers[indexPath.row]
        onDemandCell.textLabel?.text = LocaleManager.sharedInstace.localeDictionary[localeName]
        
        
        return onDemandCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NSLocale.availableLocaleIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedLocale: Int
        if UserDefaults.standard.object(forKey: selectedLocaleKey) != nil {
            selectedLocale = UserDefaults.standard.object(forKey: selectedLocaleKey) as! Int
        } else {
            selectedLocale = 0
        }
        
        
        let tempIndexPath: IndexPath = IndexPath(row: selectedLocale , section: 0)
        if let unselectedCell: UITableViewCell = tableView.cellForRow(at: tempIndexPath) {
            unselectedCell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.setSelected(true, animated: true)
        selectedCell.accessoryType = UITableViewCellAccessoryType.checkmark
        UserDefaults.standard.set(indexPath.row, forKey: selectedLocaleKey)
        
        NotificationCenter.default.post(Notification(name: Notification.Name(notificationUpdatedLocale), object: Int(indexPath.row)))
    }
}
