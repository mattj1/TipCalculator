//
//  SettingsDataManager.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/25/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

enum ThemeEnum {
    case Light
    case Dark
}


class SettingsDataManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var presenter:SettingsPresenter?;
    
    var themeCells = [SettingsCell]();
    var localeCells = [SettingsCell]();
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Country"
        }
        return "Color Preference"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let onDemandCell: UITableViewCell = UITableViewCell()
        onDemandCell.backgroundColor = Theme.settingsTableBackgroundColor
        onDemandCell.textLabel?.textColor = Theme.settingsTableFontColor
        
        var cellArray:[SettingsCell];
        
        if(indexPath.section == 1) {
            cellArray = localeCells;
        } else {
            cellArray = themeCells;
        }
        
        let cell:SettingsCell = cellArray[indexPath.row];
        
        onDemandCell.textLabel?.text = cell.caption;
        
        if cell.selected {
            onDemandCell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            onDemandCell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        return onDemandCell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return localeCells.count;
        }
        
        return themeCells.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.setSelected(true, animated: true)
        selectedCell.accessoryType = UITableViewCellAccessoryType.checkmark
        
        if indexPath.section == 1 {

            presenter?.selectLocale(index: indexPath.row);
            return
        }
        
        presenter?.selectTheme(index: indexPath.row);
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Theme.settingsHeaderBackgroundColor
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Theme.settingsHeaderFontColor
    }
    
    
    func setThemeCells(cells:[SettingsCell]) {
        themeCells = cells;
    }
    
    func setLocaleCells(cells:[SettingsCell]) {
        localeCells = cells;
    }
}
