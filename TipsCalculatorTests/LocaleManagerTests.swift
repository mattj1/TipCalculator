//
//  LocaleManagerTests.swift
//  TipsCalculator
//
//  Created by Arturo Fernandez on 9/21/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import XCTest
@testable import TipsCalculator
import UIKit

class LocaleManagerTests: XCTestCase {
    var localeManager: LocaleManager?
    override func setUp() {
        super.setUp()
        localeManager = LocaleManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //Tests that an instance was initialized
    func testLocaleManager_Initialized() {
        XCTAssertEqual(Locale.availableIdentifiers.count, (localeManager?.localeDictionary.count)!, "NSLocale.availableLocaleIdentifiers should have equal count to localeManager localeDictionary count")
    }
    
    func testStripLocale_ObtainsStrippedString() {
        let components = localeManager?.stripLocale(value: "$500,00")
        
        XCTAssertEqual(components, "500.00", "Strings must be equal after stripping the locale")
    }
    
//    func testFormatLocale_ObtainsFormattedString() {
//        let nonFormattedString = "5.00"
//        let locale = Locale.availableIdentifiers
//        
//        let formattedString = localeManager?.formatLocale(value: nonFormattedString, locale: locale[1]) //Croatian (Boznia & Herzegovina)
//        
//        XCTAssertEqual(formattedString, "5,00 KM", "Localized string should match")
//    }
    
    func testReturnFloatWithoutLocale_ObtainsFloat() {
        let localeString = "5,00 KM"
        
        let floatValue = localeManager?.returnFloatWithoutLocale(value: localeString)
        
        XCTAssertEqual(floatValue, Float(5.00), "Float values should be equal")
        
        
    }
    
}
