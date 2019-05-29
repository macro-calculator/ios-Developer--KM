//
//  AppearanceHelper.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static let darkGreen = UIColor(red: 23 / 255, green: 35 / 255, blue: 40 / 255, alpha: 1)
    static let lightGreen = UIColor(red: 21 / 255, green: 125 / 255, blue: 124 / 255, alpha: 1)
    static let babyBlue = UIColor(red: 110 / 255, green: 189 / 255, blue:  219 / 255, alpha: 1)
    static let lightLime = UIColor(red: 199 / 255, green: 221 / 255, blue: 204 / 255, alpha: 1)
    static let offWhite =  UIColor(red: 254 / 255, green: 254 / 255, blue: 253 / 255, alpha: 1)

    static func setTheme() {
        
        UIButton.appearance().backgroundColor = lightLime
        UIButton.appearance().tintColor = darkGreen
        
        UISegmentedControl.appearance().backgroundColor = darkGreen
        UISegmentedControl.appearance().tintColor = lightLime
        
        UITextField.appearance().backgroundColor = offWhite
        
        
    }
    
}

