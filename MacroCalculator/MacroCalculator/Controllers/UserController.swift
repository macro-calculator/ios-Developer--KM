//
//  UserController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation


class UserController {
    
    var bearer: Bearer?
    
    let baseURL = URL(string: "https://lambda-macro-calculator.herokuapp.com")!
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    
    func createUser(username: String, password: String, email: String, gender: String, age: Int, height: Int, currentWeight: Int, name: String, activityLevel: String, goal: String, completion: @escaping (Error?) -> Void) {
        
        let formattedAge = Int(age)
        let formattedHeight = Int(height)
        let formattedWeight = Int(currentWeight)
        
        
        let newUser = User(username: username, password: password, email: email, gender: gender, age: formattedAge, height: formattedHeight, currentWeight: formattedWeight, name: name, activityLevel: activityLevel, goal: goal)
        
        
        let requestURL = baseURL
            .appendingPathComponent("users")
            .appendingPathComponent("create")
        
        var request = URLRequest(url: requestURL)
        
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(newUser)
        } catch {
            NSLog("Error encoding user: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
        
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError())
                return
            }
            
            if let error = error {
                NSLog("Error signing up \(error)")
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
    }
    
    
    func logIn(username: String, password: String, completion: @escaping (Error?) -> Void) {
        
        let requestURL = baseURL
            .appendingPathComponent("users")
            .appendingPathComponent("create")
        
        var postData = NSMutableData(data: "grant_type=password".data(using: String.Encoding.utf8)!)
        postData.append("&username=\(username)".data(using: String.Encoding.utf8)!)
        postData.append("&password=\(password)".data(using: String.Encoding.utf8)!)
        postData.append("&client_id=lambda-client".data(using: String.Encoding.utf8)!)
        postData.append("&client_secret=lambda-secret".data(using: String.Encoding.utf8)!)
        
        
        var myURL = URLRequest(url: requestURL)
        var request = NSMutableURLRequest(url: NSURL(string: "https://lambda-macro-calculator.herokuapp.com/oauth/token")! as URL)
        
        request.httpMethod = HTTPMethod.get.rawValue
        request.httpBody = postData as Data
        
    }
    
    
    func fetchUser(token: String, completion: @escaping (User, Error?) -> Void) {
        
        
        
    }
    
    
    func updateUser(token: String, completion: @escaping (Error?) -> Void) {
        
        
        
    }
    
    
}
