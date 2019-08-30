//
//  FoodViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var weightIndicatorLabel: UILabel!
    @IBOutlet weak var indicatorToTheRightImageView: UIImageView!
    @IBOutlet weak var indicatorToTheLeftImageView: UIImageView!
    @IBOutlet weak var cupNumberLabel: UILabel!
    @IBOutlet weak var cupLabel: UILabel!
    @IBOutlet weak var slashLabel: UILabel!
    @IBOutlet weak var gramNumberLabel: UILabel!
    @IBOutlet weak var gramLabel: UILabel!
    @IBOutlet weak var kcalAmountLabel: UILabel!
    
    var passedWeight:Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Food"
        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.weightLabel.frame.origin.y += CGFloat(self.passedWeight)
            self.weightNumberLabel.frame.origin.y += CGFloat(self.passedWeight)
            self.kgLabel.frame.origin.y += CGFloat(self.passedWeight)
            self.weightIndicatorLabel.frame.origin.y += CGFloat(self.passedWeight)
            self.indicatorToTheRightImageView.frame.origin.y += CGFloat(self.passedWeight)
            
            self.indicatorToTheLeftImageView.frame.origin.y -= CGFloat(self.passedWeight)
            self.cupNumberLabel.frame.origin.y -= CGFloat(self.passedWeight)
            self.cupLabel.frame.origin.y -= CGFloat(self.passedWeight)
            self.slashLabel.frame.origin.y -= CGFloat(self.passedWeight)
            self.gramNumberLabel.frame.origin.y -= CGFloat(self.passedWeight)
            self.gramLabel.frame.origin.y -= CGFloat(self.passedWeight)
            self.kcalAmountLabel.frame.origin.y -= CGFloat(self.passedWeight)
        }, completion: nil)

        
//        UIView.animate(withDuration: 2) {
//            self.weightLabel.frame.origin.y += CGFloat(self.passedWeight)
//            self.weightNumberLabel.frame.origin.y += CGFloat(self.passedWeight)
//            self.kgLabel.frame.origin.y += CGFloat(self.passedWeight)
//            self.weightIndicatorLabel.frame.origin.y += CGFloat(self.passedWeight)
//            self.indicatorToTheRightImageView.frame.origin.y += CGFloat(self.passedWeight)
//
//            self.indicatorToTheLeftImageView.frame.origin.y -= CGFloat(self.passedWeight)
//            self.cupNumberLabel.frame.origin.y -= CGFloat(self.passedWeight)
//            self.cupLabel.frame.origin.y -= CGFloat(self.passedWeight)
//            self.slashLabel.frame.origin.y -= CGFloat(self.passedWeight)
//            self.gramNumberLabel.frame.origin.y -= CGFloat(self.passedWeight)
//            self.gramLabel.frame.origin.y -= CGFloat(self.passedWeight)
//            self.kcalAmountLabel.frame.origin.y -= CGFloat(self.passedWeight)
//
//        }
//        weightLabel.layer.animate(fromValue: <#T##Any#>, toValue: <#T##Any#>, keyPath: <#T##String#>)
        
//        weightLabel.frame.offsetBy(dx: 0, dy: CGFloat(passedWeight))
        
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
