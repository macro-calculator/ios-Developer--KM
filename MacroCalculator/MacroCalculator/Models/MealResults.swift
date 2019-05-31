//
//  MealResults.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/31/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation


struct MealResults {
    
    var proteinsPerMeal: Double?
    var fatsPerMeal: Double?
    var carbsPerMeal: Double?
    
    var proteinsPerSnack: Double?
    var fatsPerSnack: Double?
    var carbsPerSnack: Double?
    
    init(proteinsPerMeal: Double? = 0, fatsPerMeal: Double? = 0, carbsPerMeal: Double? = 0, proteinsPerSnack: Double? = 0, fatsPerSnack: Double? = 0, carbsPerSnack: Double? = 0) {
        self.proteinsPerMeal = proteinsPerMeal
        self.fatsPerMeal = fatsPerMeal
        self.carbsPerMeal = carbsPerMeal
        self.proteinsPerSnack = proteinsPerSnack
        self.fatsPerSnack = fatsPerSnack
        self.carbsPerSnack = carbsPerSnack
    }
    
    
    
}
