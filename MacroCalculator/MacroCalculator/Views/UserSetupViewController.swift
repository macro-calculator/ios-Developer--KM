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
    var user: User?
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
//        let gradient = CAGradientLayer()
//        gradient.frame = view.bounds
//        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor, AppearanceHelper.darkGreen.cgColor]
//        view.layer.insertSublayer(gradient, at: 0)
    }
    

    @IBAction func save(_ sender: UIButton) {
        
        performSegue(withIdentifier: "TestingSummarySegue", sender: self)
        
        
    }
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "TestingSummarySegue" {
            guard let destinationVC = segue.destination as? SummaryViewController else { return }
            destinationVC.username = username
        }
    }

}
