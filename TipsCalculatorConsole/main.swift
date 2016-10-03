//
//  main.swift
//  TipsCalculatorConsole
//
//  Created by Matt Johnson on 10/2/16.
//  Copyright © 2016 Arturo Fernandez. All rights reserved.
//

import Foundation

var mainModule:MainModule = MainModule();

func input() -> String {
    let input = String(
        data: FileHandle.standardInput.availableData,
        encoding: String.Encoding.utf8)
    
    return input!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
}

ConsoleTipCalculatorView(tipCalculatorModule:mainModule.createTipCalculatorModule());

