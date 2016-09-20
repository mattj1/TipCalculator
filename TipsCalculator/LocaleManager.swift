//
//  LocaleManager.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/19/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation
import UIKit

class LocaleManager {
    
    static let sharedInstace: LocaleManager = {
        let instance = LocaleManager()
        
        return instance
    }()
    
    var identifiersArray: [String]
    var localeDictionary: [String: String] = [String: String]()
    
    init() {
        identifiersArray = NSLocale.availableLocaleIdentifiers
        let locale = NSLocale(localeIdentifier: "en_US")
        for identifier in identifiersArray {
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
    
    func formatLocale(value: String, locale: Int) -> String {
        let appendedComponents: String = self.stripLocale(value: value)
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale(identifier: LocaleManager.sharedInstace.identifiersArray[locale])
        let totalPriceNumber: Float = Float(appendedComponents)!
        
        return formatter.string(from: NSNumber(value: totalPriceNumber))!
    }
    
    func returnDecimalWithoutLocale(value: String, locale: Int) -> Float {
        let appendedComponents: String = self.stripLocale(value: value)
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale(identifier: LocaleManager.sharedInstace.identifiersArray[locale])
        let totalPriceNumber: Float = Float(appendedComponents)!
        
        return totalPriceNumber
    }
    
}


