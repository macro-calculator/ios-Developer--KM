//
//  LogInViewController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBOutlet weak var entryMethodSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    enum EntryType {
        case signUp
        case logIn
    }
    
    
    //var apiController: APIController?
    
    var entryType: EntryType = .signUp
    
    
    
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
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        if entryType == .logIn {
            enterButton.setTitle("Log In", for: .normal)
            entryMethodSegmentedControl.selectedSegmentIndex = 0
        } else {
            enterButton.setTitle("Sign Up", for: .normal)
            entryMethodSegmentedControl.selectedSegmentIndex = 1
        }
    }
    


}
