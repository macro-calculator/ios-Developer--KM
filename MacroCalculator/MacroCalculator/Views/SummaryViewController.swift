//
//  SummaryViewController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    var userController: UserController?
    
    @IBOutlet weak var goalsView: UIView!
    @IBOutlet weak var mealsView: UIView!
    
    @IBOutlet weak var proteinPercentageLabel: UILabel!
    @IBOutlet weak var fatsPercentageLabel: UILabel!
    @IBOutlet weak var carbsPercentageLabel: UILabel!
    
    @IBOutlet weak var mealsButton: UIButton!
        
    @IBOutlet weak var proteinTotalLabel: UILabel!
    @IBOutlet weak var fatsTotalLabel: UILabel!
    @IBOutlet weak var carbsTotalLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if userController?.currentUser == nil {
            performSegue(withIdentifier: "EntrySegue", sender: self)
        }
        guard let user = userController?.currentUser, isViewLoaded else { return }
        updateValues(user: user)
        showMacros(user: user)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = userController?.currentUser else { return }
        setStyle()
        showMacros(user: user)
        updateValues(user: user)
    }
    

    func setStyle() {
        
        AppearanceHelper.style2(button: mealsButton)
        
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor, AppearanceHelper.darkGreen.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        goalsView.backgroundColor = .clear
        mealsView.backgroundColor = .clear
        
        proteinPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 32)
        fatsPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 32)
        carbsPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 32)
        
        proteinTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 32)
        fatsTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 32)
        carbsTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 32)
    }

    func updateValues(user: User) {
        userController?.calculateMacros(user: user)
    }
    

    func showMacros(user: User) {
        let proPerc = Double(round(10*user.proteinsPercentage!)/10)
        let fatPerc = Double(round(100*user.fatsPercentage!)/100)
        let carbPerc = Double(round(100*user.carbsPercentage!)/100)
        
        let proTot = Double(round(10*user.dailyProteins!)/10)
        let fatTot = Double(round(10*user.dailyFats!)/10)
        let carbTot = Double(round(10*user.dailyCarbs!)/10)
        
        proteinPercentageLabel.text = "\(proPerc)%"
        fatsPercentageLabel.text = "\(fatPerc)%"
        carbsPercentageLabel.text = "\(carbPerc)%"
        
        proteinTotalLabel.text = "\(proTot)g"
        fatsTotalLabel.text = "\(fatTot)g"
        carbsTotalLabel.text = "\(carbTot)g"
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MealsSegue" {
            guard let destinationVC = segue.destination as? MealViewController else { return }
            destinationVC.userController = userController
        }
    }

}
