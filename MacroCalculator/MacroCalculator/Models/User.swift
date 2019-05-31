//
//  User.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

struct User {
    
    let name: String
    let username: String
    let password: String
    var email: String
    var gender: String
    var age: Int
    var height: Int
    var currentWeight: Int
    var activityLevel: String
    var goal: String
    
    var proteinsPercentage: Double?
    var fatsPercentage: Double?
    var carbsPercentage: Double?
    
    var dailyProteins: Double?
    var dailyFats: Double?
    var dailyCarbs: Double?
    
    var bmr: Double?
    var totalCal: Double?
    
    var mealPlan: String?
    
    
    init(username: String, password: String, name: String, email: String, gender: String, age: Int, height: Int, currentWeight: Int, activityLevel: String, goal: String, proteinsPercentage: Double? = 0, fatsPercentage: Double? = 0, carbsPercentage: Double? = 0, dailyProteins: Double? = 0, dailyFats: Double? = 0, dailyCarbs: Double? = 0, bmr: Double? = 0, totalCal: Double? = 0, mealPlan: String? = nil) {
        
        self.username = username
        self.password = password
        self.name = name
        self.email = email
        self.gender = gender
        self.age = age
        self.height = height
        self.currentWeight = currentWeight
        self.activityLevel = activityLevel
        self.goal = goal
        self.proteinsPercentage = proteinsPercentage
        self.fatsPercentage = fatsPercentage
        self.carbsPercentage = carbsPercentage
        self.dailyProteins = dailyProteins
        self.dailyFats = dailyFats
        self.dailyCarbs = dailyCarbs
        self.bmr = bmr
        self.totalCal = totalCal
        self.mealPlan = mealPlan
        
        
    }
    
    
}
