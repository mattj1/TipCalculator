//
//  LocaleManager.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/19/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class LocaleManager: Equatable {
    
    var userPrefs:UserPrefs;
    
    var localeDictionary: [String: String] = [String: String]()
    
    init(identifiers: [String]? = NSLocale.availableLocaleIdentifiers, userPrefs:UserPrefs) {
        self.userPrefs = userPrefs;
        
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
    
    private func currentLocale() -> Locale {
        var s:Int = userPrefs.getSelectedLocale();
        if(s >= Locale.availableIdentifiers.count) {
            s = 0;
        }
        let l_id:String = Locale.availableIdentifiers[s];
        
        //print("selected: \(s) id: \(l_id)");
        return Locale(identifier: l_id);
    }
    
    func getAllLocales() -> [String] {
        return NSLocale.availableLocaleIdentifiers;
    }
    
    func getLocaleCount() -> Int {
        return NSLocale.availableLocaleIdentifiers.count;
    }
    
    func getLocaleNameForId(localeID:String) -> String {
        return localeDictionary[localeID]!;
    }
}


