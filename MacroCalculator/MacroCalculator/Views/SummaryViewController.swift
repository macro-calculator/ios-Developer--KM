//
//  SummaryViewController.swift
//  MacroCalculator
//
//  Created by Kobe McKee on 5/28/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var goalsView: UIView!
    @IBOutlet weak var mealsView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.backgroundColor = AppearanceHelper.lightLime
//        let gradient = CAGradientLayer()
//        gradient.frame = view.bounds
//        gradient.colors = [AppearanceHelper.darkGreen.cgColor, AppearanceHelper.lightLime.cgColor, AppearanceHelper.darkGreen.cgColor]
//        view.layer.insertSublayer(gradient, at: 0)
        
        goalsView.backgroundColor = .clear
        mealsView.backgroundColor = .clear
        
        
//        let gradient2 = CAGradientLayer()
//        gradient2.frame = mealsView.bounds
//        gradient2.colors = [AppearanceHelper.lightGreen.cgColor, AppearanceHelper.offWhite.cgColor]
//        goalsView.layer.insertSublayer(gradient2, at: 0)
//        mealsView.layer.insertSublayer(gradient2, at: 0)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        performSegue(withIdentifier: "EntrySegue", sender: self)
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
