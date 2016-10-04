//
//  iOSComponentProvider.swift
//  TipsCalculator
//
//  Created by Matt Johnson on 10/3/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

class iOSComponentProvider : ComponentProvider {
    func provideUserPrefs() -> UserPrefs {
        return UserPrefsUserDefaults();
    }
}
