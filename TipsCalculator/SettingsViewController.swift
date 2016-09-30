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
let notificationUpdateUIColors: String = "updateUIColors"

protocol SettingsProtocol {
    var selectedLocale: Int{ get }
}

typealias SettingsViewControllerComposed = UITableViewDataSource & UITableViewDelegate

class SettingsViewController: UIViewController {
    @IBOutlet var localeTableView: UITableView?
    @IBOutlet var settingsDataManager: SettingsViewControllerComposed?
    
    override func viewDidLoad() {
        localeTableView?.delegate = settingsDataManager
        localeTableView?.dataSource = settingsDataManager
        self.title = "Settings"
        NotificationCenter.default.addObserver(self, selector: #selector(dismissSelf), name: Notification.Name(notificationUpdatedLocale), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIColors), name: Notification.Name(notificationUpdateUIColors), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUIColors()
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
