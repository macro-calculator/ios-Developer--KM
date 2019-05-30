//
//  UserSetupViewController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class UserSetupViewController: UIViewController {

    var userController: UserController?
    var username: String?
    var password: String?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var activityLevelTextField: UITextField!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        AppearanceHelper.style2(button: saveButton)

        view.backgroundColor = AppearanceHelper.lightLime
    }
    

    @IBAction func save(_ sender: UIButton) {
        
        guard let username = username,
            let password = password,
            let name = nameTextField.text,
            let email = emailTextField.text,
            let gender = genderTextField.text,
            let age = ageTextField.text,
            let formattedAge = Int(age),
            let height = heightTextField.text,
            let formattedHeight = Int(height),
            let weight = weightTextField.text,
            let formattedWeight = Int(weight),
            let activityLevel = activityLevelTextField.text,
            let goal = goalTextField.text else { return }
        
            userController?.createUser(username: username, password: password, name: name, email: email, gender: gender, age: formattedAge, height: formattedHeight, currentWeight: formattedWeight, activityLevel: activityLevel, goal: goal)
        
            performSegue(withIdentifier: "ToSummarySegue", sender: self)

    }
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "TestingSummarySegue" {
            guard let destinationVC = segue.destination as? SummaryViewController else { return }
            destinationVC.userController = userController
        }
    }

}
