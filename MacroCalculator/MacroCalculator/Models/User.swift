//
//  User.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

struct User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case email
        case gender
        case age
        case height
        case currentWeight = "currentweight"
        case name
        case activityLevel = "activitylevel"
        case goal
    }
    
    
    let username: String
    let password: String
    var email: String
    var gender: String
    var age: Int
    var height: Int
    var currentWeight: Int
    var name: String
    var activityLevel: String
    var goal: String
    
    
    
    
}
