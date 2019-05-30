//
//  SummaryViewController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    var username: String?
    
    
    
    @IBOutlet weak var goalsView: UIView!
    @IBOutlet weak var mealsView: UIView!
    
    
    @IBOutlet weak var proteinPercentageLabel: UILabel!
    @IBOutlet weak var fatsPercentageLabel: UILabel!
    @IBOutlet weak var carbsPercentageLabel: UILabel!
    
    
    
    @IBOutlet weak var proteinTotalLabel: UILabel!
    @IBOutlet weak var fatsTotalLabel: UILabel!
    @IBOutlet weak var carbsTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //view.backgroundColor = AppearanceHelper.lightLime
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor, AppearanceHelper.darkGreen.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        goalsView.backgroundColor = .clear
        mealsView.backgroundColor = .clear
        
        proteinPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 64)
        fatsPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 64)
        carbsPercentageLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 64)
        
        proteinTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 64)
        fatsTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 64)
        carbsTotalLabel.font = AppearanceHelper.threeDFont(textStyle: .title1, pointSize: 64)
          
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if username == nil {
            performSegue(withIdentifier: "EntrySegue", sender: self)
        }
        
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
