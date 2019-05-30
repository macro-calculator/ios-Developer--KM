//
//  UserController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/30/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation


class UserController {
    
    //Goal Factor
        //Aggressive Weight Loss(20% deficit) = 0.8
        //Moderate Weight Loss(15% deficit) = 0.85
        //Weight Loss(10% deficit) = 0.9
        //Maintain Weight = 1
        //Moderate Weight Gain(10% surplus) = 1.1
        //Aggressive Weight Gain(15 surplus) = 1.15
    
    
    //Activity Factor
        //0 days = 1.2
        //1-2 days = 1.375
        //3-4 days = 1.55
        //5-6 days = 1.725
        //7 days = 1.9
    
    //Women BMR = 655 + (4.35 x weight) + (4.7 x height) - (4.5 x age)
    
    //Men BMR = 66 + (6.23 x weight) + (12.7 x height) - (6.8 x age)
    
    //TDEE(Total Daily Energy Expenditure) = BMR * ActivityFactor
    
    //Total Calories = TDEE * GoalFactor
    
    
    
    var currentUser: User?
    
    func createUser(username: String, password: String, name: String, email: String, gender: String, age: Int, height: Int, currentWeight: Int, activityLevel: String, goal: String) {
        
        let newUser = User(username: username, password: password, name: name, email: email, gender: gender, age: age, height: height, currentWeight: currentWeight, activityLevel: activityLevel, goal: goal)
        
        currentUser = newUser
    }
    
    func upDateUser(currentWeight: Int, activityLevel: String, goal: String) {
        
        currentUser?.currentWeight = currentWeight
        currentUser?.activityLevel = activityLevel
        currentUser?.goal = goal
    }
    
    func getActivityFactor(activity: String) -> Double {
        switch(activity) {
        case "0 days":
            return 1.2
        case "1-2 days":
            return 1.375
        case "3-4 days":
            return 1.55
        case "5-6 days":
            return 1.725
        case "7 days":
            return 1.9
        default:
            return 0
        }
    }
    
    func getGoalFactor(goal: String) -> Double {
        switch(goal) {
        case "Aggressive Weight Loss(20% deficit)":
            return 0.8
        case "Moderate Weight Loss(15% deficit)":
            return 0.85
        case "Weight Loss(10% deficit)":
            return 0.9
        case "Maintain Weight":
            return 1
        case "Moderate Weight Gain(10% surplus)":
            return 1.1
        case "Aggressive Weight Gain(15 surplus)":
            return 1.15
        default:
            return 0
        }
    }
    
    
    func calculateMacros(user: User) {
        
      var updatedUser = user
        
        var bmr: Double = 0.0
        if user.gender == "M" {
            
            let bmrWeight = 6.23 * Double(user.currentWeight)
            let bmrHeight = 12.7 * Double(user.height)
            let bmrAge = 6.8 * Double(user.age)

            bmr = 66 + bmrWeight + bmrHeight - bmrAge
        
        } else {
            
            let bmrWeight = 4.35 * Double(user.currentWeight)
            let bmrHeight = 4.7 * Double(user.height)
            let bmrAge = 4.5 * Double(user.age)
            
            
            bmr = 655 + bmrWeight + bmrHeight - bmrAge
        }
        updatedUser.bmr = bmr

        let goalFactor = getGoalFactor(goal: user.goal)
        let activityFactor = getActivityFactor(activity: user.activityLevel)
        
        let tdee = bmr * activityFactor
        let totalCal = tdee * goalFactor
        updatedUser.totalCal = totalCal
        
        updatedUser.dailyProteins = totalCal * 0.075
        updatedUser.dailyFats = totalCal * 0.033
        updatedUser.dailyCarbs = totalCal * 0.1
        
        guard let proteins = updatedUser.dailyProteins,
            let fats = updatedUser.dailyFats,
            let carbs = updatedUser.dailyCarbs else { return }
        
        updatedUser.proteinsPercentage = totalCal / proteins
        updatedUser.fatsPercentage = totalCal / fats
        updatedUser.carbsPercentage = totalCal / carbs
        
        
        currentUser = updatedUser
        
        
    }
    
    
}
