//
//  LocaleManager.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/19/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
//import UIKit

let selectedLocaleKey: String = "selectedLocale"

class LocaleManager: Equatable {
    
    static let sharedInstace: LocaleManager = {
        let instance = LocaleManager()
        
        return instance
    }()
    
    var localeDictionary: [String: String] = [String: String]()
    
    init(identifiers: [String]? = NSLocale.availableLocaleIdentifiers) {
        let locale = NSLocale(localeIdentifier: "en_US")
        for identifier in identifiers! {
            let name: String = locale.displayName(forKey: NSLocale.Key.identifier, value: identifier)!
            localeDictionary[identifier] = name
        }
    }
    
    func stripLocale(value: String) -> String {
        let cleanedString: CharacterSet = CharacterSet(charactersIn: "0123456789.,").inverted
        let totalComponents: [String] = (value.components(separatedBy: cleanedString) )
        var appendedComponents: String = ""
        
        for component: String in totalComponents {
            appendedComponents.append(component)
        }
        
        appendedComponents = appendedComponents.replacingOccurrences(of: ",", with: ".")
        
        if appendedComponents.characters.count == 0 {
            appendedComponents = "0.00"
        }
        
        return appendedComponents
    }
    
    func formatLocale(value: String) -> String {
        let appendedComponents: String = self.stripLocale(value: value)
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = currentLocale();
        let totalPriceNumber: Float = Float(appendedComponents)!

        return formatter.string(from: NSNumber(value: totalPriceNumber))!
    }
    
    func returnFloatWithoutLocale(value: String) -> Float {
        let appendedComponents: String = self.stripLocale(value: value)
        let totalPriceNumber: Float = Float(appendedComponents)!
        
        return totalPriceNumber
    }
    
    public static func ==(lhs: LocaleManager, rhs: LocaleManager) -> Bool {
        if (lhs.localeDictionary.count != rhs.localeDictionary.count) {
            return false
        }
        
        for identifier in NSLocale.availableLocaleIdentifiers {
            if lhs.localeDictionary[identifier] != rhs.localeDictionary[identifier] {
                return false
            }
        }
        
        return true
    }
    
    var selectedLocale: Int {
        if (UserDefaults.standard.object(forKey: selectedLocaleKey) != nil) {
            return UserDefaults.standard.object(forKey: selectedLocaleKey) as! Int
        }
        
        return 0
    }
    
    private func currentLocale() -> Locale {
        return Locale(identifier: Locale.availableIdentifiers[self.selectedLocale]);
    }
}


