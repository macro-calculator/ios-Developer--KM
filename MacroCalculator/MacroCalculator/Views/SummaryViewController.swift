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
    
    
    
    @IBOutlet weak var proteinTotalLabel: UILabel!
    @IBOutlet weak var fatsTotalLabel: UILabel!
    @IBOutlet weak var carbsTotalLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if userController?.currentUser == nil {
            performSegue(withIdentifier: "EntrySegue", sender: self)
        }
        guard let user = userController?.currentUser else { return }
        updateValues(user: user)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = userController?.currentUser else { return }
        setStyle()
        showMacros(user: user)
    }
    

    func setStyle() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor, AppearanceHelper.darkGreen.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        goalsView.backgroundColor = .clear
        mealsView.backgroundColor = .clear
        
        proteinPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 48)
        fatsPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 48)
        carbsPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 48)
        
        proteinTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 48)
        fatsTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 48)
        carbsTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 48)
    }

    func updateValues(user: User) {
        userController?.calculateMacros(user: user)
    }
    

    func showMacros(user: User) {
        let proPerc = user.proteinsPercentage!
        let fatPerc = user.fatsPercentage!
        let carbPerc = user.carbsPercentage!
        
        let proTot = user.dailyProteins!
        let fatTot = user.dailyFats!
        let carbTot = user.dailyCarbs!
        
        proteinPercentageLabel.text = "\(proPerc)%"
        fatsPercentageLabel.text = "\(fatPerc)%"
        carbsPercentageLabel.text = "\(carbPerc)%"
        
        proteinTotalLabel.text = "\(proTot)%"
        fatsTotalLabel.text = "\(fatTot)%"
        carbsTotalLabel.text = "\(carbTot)%"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
