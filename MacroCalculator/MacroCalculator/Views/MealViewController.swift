//
//  MealViewController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var userController: UserController?
    var mealResults: MealResults?
    
    @IBOutlet weak var MealTable: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var selectMealPlanButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MealTable.delegate = self
        MealTable.dataSource = self
        
        guard let user = userController?.currentUser else { return }

        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        AppearanceHelper.style2(button: backButton)
        AppearanceHelper.style2(button: selectMealPlanButton)
        
        MealTable.backgroundColor = AppearanceHelper.lightLime
        
        mealResults = userController?.selectMealPlan(user: user)
        print(mealResults)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(userController?.currentUser?.mealPlan) {
        case "4 meals":
            return 4
        case "3 meals":
            return 3
        case "3 meals 2 snacks":
            return 5
        default:
            return 3
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = MealTable.dequeueReusableCell(withIdentifier: "MealCell") as? MealTableViewCell,
            let mealResults = mealResults,
            let mealPlan = userController?.currentUser?.mealPlan else { return UITableViewCell()}
        cell.proteinsLabel.numberOfLines = 0
        cell.fatsLabel.numberOfLines = 0
        cell.carbsLabel.numberOfLines = 0
        
        cell.backgroundColor = AppearanceHelper.darkGreen
        cell.mealLabel.textColor = AppearanceHelper.lightLime
        cell.proteinsLabel.textColor = AppearanceHelper.lightLime
        cell.fatsLabel.textColor = AppearanceHelper.lightLime
        cell.carbsLabel.textColor = AppearanceHelper.lightLime
        
        guard let pMeal = mealResults.proteinsPerMeal,
            let fMeal = mealResults.fatsPerMeal,
            let cMeal = mealResults.carbsPerMeal else { return UITableViewCell()}
        
        let proMeal = Int(pMeal)
        let fatMeal = Int(fMeal)
        let carMeal = Int(cMeal)
        
        if mealPlan == "4 meals" || mealPlan == "3 meals" {
            cell.mealLabel.text = "Meal \(indexPath.row + 1)"
            cell.proteinsLabel.text = "Proteins:\n\(proMeal)"
            cell.fatsLabel.text = "Fats:\n\(fatMeal)"
            cell.carbsLabel.text = "Carbs:\n\(carMeal)"
            return cell
        } else {
            
            guard let pSnack = mealResults.proteinsPerSnack,
                let fSnack = mealResults.fatsPerSnack,
                let cSnack = mealResults.carbsPerSnack else { return UITableViewCell()}
            
            let proSnack = Int(pSnack)
            let fatSnack = Int(fSnack)
            let carSnack = Int(cSnack)
            
            
            if indexPath.row == 1 || indexPath.row == 3 {
                cell.mealLabel.text = "Snack \(indexPath.row)"
                cell.proteinsLabel.text = "Proteins:\n\(proSnack)"
                cell.fatsLabel.text = "Fats:\n\(fatSnack)"
                cell.carbsLabel.text = "Carbs:\n\(carSnack)"
            } else {
                cell.mealLabel.text = "Meal \(indexPath.row + 1)"
                cell.proteinsLabel.text = "Proteins:\n\(proMeal)"
                cell.fatsLabel.text = "Fats:\n\(fatMeal)"
                cell.carbsLabel.text = "Carbs:\n\(carMeal)"
            }
            return cell
        }
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FromMealPlan" {
            guard let destinationVC = segue.destination as? SummaryViewController else { return }
            destinationVC.userController = userController
        }
    }

}
