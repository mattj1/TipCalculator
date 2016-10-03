//
//  SettingsViewController.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/18/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

typealias SettingsViewControllerComposed = UITableViewDataSource & UITableViewDelegate

class SettingsViewController: UIViewController, SettingsView {
    @IBOutlet var localeTableView: UITableView?
    @IBOutlet var settingsDataManager: SettingsDataManager?
    
    var presenter:SettingsPresenterImpl?;
    var userPrefs:UserPrefs?;
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        
        self.userPrefs = appDelegate.mainModule().getUserPrefs();
        self.presenter = SettingsPresenterImpl(localeManager:appDelegate.mainModule().getLocaleManager(), userPrefs:self.userPrefs!);
        
        self.presenter?.view = self;
        
        
    }
    
    override func viewDidLoad() {
        localeTableView?.delegate = settingsDataManager
        localeTableView?.dataSource = settingsDataManager
        
        settingsDataManager?.presenter = self.presenter;
        
        self.title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUIColors()
        
        presenter?.viewWillAppear();
    }
    
    func setTheme(index:Int) {
        let themeValue: ThemeEnum = index == 0 ? ThemeEnum.Light : ThemeEnum.Dark
        //var row: Int = 1
        switch themeValue {
        case ThemeEnum.Light:
            Theme.themeLight(userPrefs:userPrefs!)
        case ThemeEnum.Dark:
            Theme.themeDark(userPrefs:userPrefs!)
      //      row = 0
        }
        
        updateUIColors();
    }
    
    func close() {
        self.dismissSelf();
    }
    
    func setThemeCells(cells:[SettingsCell]) {
        settingsDataManager?.setThemeCells(cells:cells);
        localeTableView?.reloadData();
    }
    
    func setLocaleCells(cells:[SettingsCell]) {
        settingsDataManager?.setLocaleCells(cells:cells);
        localeTableView?.reloadData();
    }
}

//UI Events and notifications
extension SettingsViewController {
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func dismissSelf() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateUIColors() {
        self.localeTableView?.tintColor = Theme.settingsTableFontColor
        self.localeTableView?.backgroundColor = Theme.settingsTableBackgroundColor
        localeTableView?.reloadSections(NSIndexSet.init(indexesIn: NSMakeRange(0, 1)) as IndexSet, with: UITableViewRowAnimation.automatic)
        localeTableView?.reloadData()
        self.navigationController?.navigationBar.tintColor = Theme.toolBarButtonTintColor
    }
}
