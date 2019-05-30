//
//  LogInViewController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    let userController = UserController()
    
    @IBOutlet weak var entryMethodSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    enum EntryType {
        case signUp
        case logIn
    }
    
    var entryType: EntryType = .signUp
    
    var username: String = ""
    var password: String = ""
    
    @IBAction func entryTypeChanged(_ sender: UISegmentedControl) {
        if entryMethodSegmentedControl.selectedSegmentIndex == 0 {
            entryType = .logIn
            enterButton.setTitle("Log In", for: .normal)
        } else {
            entryType = .signUp
            enterButton.setTitle("Sign Up", for: .normal)
        }
    }
    
    
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text,
            let password = passwordTextField.text else { return }
        
        
        if username == "kmac" && password == "password" {
            
            if entryType == .logIn {
                userController.currentUser = User(username: "kmac", password: "password", name: "Kobe", email: "kobe@gmail", gender: "Male", age: 22, height: 70, currentWeight: 150, activityLevel: "3-4 days", goal: "Moderate Weight Loss(15% deficit)")
                
                dismiss(animated: true) {
                    if let presenter = self.presentingViewController as? SummaryViewController{
                        presenter.userController = self.userController
                        
                    }
                }
                
            } else if !username.isEmpty && !password.isEmpty{
                performSegue(withIdentifier: "SetupUserSegue", sender: self)
            }
            
        } else { return }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppearanceHelper.style(button: enterButton)
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor, AppearanceHelper.darkGreen.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        if entryType == .logIn {
            enterButton.setTitle("Log In", for: .normal)
            entryMethodSegmentedControl.selectedSegmentIndex = 0
        } else {
            enterButton.setTitle("Sign Up", for: .normal)
            entryMethodSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetupUserSegue" {
            guard let destinationVC = segue.destination as? UserSetupViewController,
                let username = usernameTextField.text,
                let password = passwordTextField.text else { return }
            destinationVC.username = username
            destinationVC.password = password
        }
        
    }
    


}
