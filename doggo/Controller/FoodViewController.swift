//
//  FoodViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var currentLineView: UIView!
    @IBOutlet weak var idealLineView: UIView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var idealLabel: UILabel!
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
    
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    
    var dogWeights:[Weight] = []
    
    var passedWeight = 100
    
    var currentWeight:Int = 0
    
    var yChange:Float = 0
    var minimumValue:Float = 0
    var maximumValue:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Food"
        
        dogWeights = dogs[currentDog].weightOfDog?.allObjects as! [Weight]
        
        dogName.text = dogs[currentDog].name
        dogBreed.text = "\(dogs[currentDog].breed ?? "") - Daily Feeding"
        
//        weightNumberLabel.text = "\(dogWeights)"
        
        for dogWeight in dogWeights {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "dd/MM/yyyy"
            if dateFormat.string(from: dogWeight.date!) == dateFormat.string(from: Date()) {
                weightNumberLabel.text = String(dogWeight.amount)
                currentWeight = Int(dogWeight.amount)
                
            }
        }
        
        if dogBreed.text == "Beagle"{
            minimumValue = 9
            maximumValue = 13.6
        }else if dogBreed.text == "Border Collie"{
            minimumValue = 13.6
            maximumValue = 25
        }else if dogBreed.text == "Dachshund"{
            minimumValue = 7.2
            maximumValue = 14.5
        }else if dogBreed.text == "German Shepherd"{
            minimumValue = 29.4
            maximumValue = 34
        }else if dogBreed.text == "Golden Retriever"{
            minimumValue = 29.4
            maximumValue = 34
        }else if dogBreed.text == "Great Dane"{
            minimumValue = 63.5
            maximumValue = 79.4
        }else if dogBreed.text == "Maltese"{
            minimumValue = 2
            maximumValue = 3.5
        }else if dogBreed.text == "Pomeranian"{
            minimumValue = 1.3
            maximumValue = 3.2
        }else if dogBreed.text == "Pug"{
            minimumValue = 6.3
            maximumValue = 8.1
        }else if dogBreed.text == "St. Bernard"{
            minimumValue = 63
            maximumValue = 81.5
        }
//        yChange = Float(currentWeight)/maximumValue*432
        yChange = 432 - ((maximumValue-Float(currentWeight)) / (maximumValue - minimumValue) * 432)
            
        print(currentWeight)
        print(maximumValue)
        print(yChange)
        if yChange > 432 {
            yChange = 432
        }else if yChange < 0{
            yChange = 0
        }
        if currentWeight < Int(minimumValue){
            weightIndicatorLabel.text = "Underweight"
            weightIndicatorLabel.textColor = UIColor.blue
        }else if currentWeight > Int(maximumValue){
            weightIndicatorLabel.text = "Overweight"
            weightIndicatorLabel.textColor = UIColor.red
        }else{
            weightIndicatorLabel.text = "Ideal"
            weightIndicatorLabel.textColor = UIColor.green
        }
        if maximumValue < 5.4{
            if weightIndicatorLabel.text == "Underweight"{
                cupNumberLabel.text = "1"
                gramNumberLabel.text = "128"
            }else if weightIndicatorLabel.text == "Ideal"{
                cupNumberLabel.text = "0.75"
                gramNumberLabel.text = "96"
            }else if weightIndicatorLabel.text == "Overweight"{
                cupNumberLabel.text = "0.5"
                gramNumberLabel.text = "64"
            }
        }else if maximumValue < 9.1{
            if weightIndicatorLabel.text == "Underweight"{
                cupNumberLabel.text = "1.25"
                gramNumberLabel.text = "160"
            }else if weightIndicatorLabel.text == "Ideal"{
                cupNumberLabel.text = "1"
                gramNumberLabel.text = "128"
            }else if weightIndicatorLabel.text == "Overweight"{
                cupNumberLabel.text = "0.75"
                gramNumberLabel.text = "96"
            }
        }else if maximumValue < 22.7{
            if weightIndicatorLabel.text == "Underweight"{
                cupNumberLabel.text = "1.5"
                gramNumberLabel.text = "192"
            }else if weightIndicatorLabel.text == "Ideal"{
                cupNumberLabel.text = "1.25"
                gramNumberLabel.text = "160"
            }else if weightIndicatorLabel.text == "Overweight"{
                cupNumberLabel.text = "1"
                gramNumberLabel.text = "128"
            }
        }else if maximumValue < 34{
            if weightIndicatorLabel.text == "Underweight"{
                cupNumberLabel.text = "2"
                gramNumberLabel.text = "256"
            }else if weightIndicatorLabel.text == "Ideal"{
                cupNumberLabel.text = "1.5"
                gramNumberLabel.text = "192"
            }else if weightIndicatorLabel.text == "Overweight"{
                cupNumberLabel.text = "1"
                gramNumberLabel.text = "128"
            }
        }else if maximumValue < 45.4{
            if weightIndicatorLabel.text == "Underweight"{
                cupNumberLabel.text = "2.5"
                gramNumberLabel.text = "320"
            }else if weightIndicatorLabel.text == "Ideal"{
                cupNumberLabel.text = "1.75"
                gramNumberLabel.text = "224"
            }else if weightIndicatorLabel.text == "Overweight"{
                cupNumberLabel.text = "1"
                gramNumberLabel.text = "128"
            }
        }else{
            if weightIndicatorLabel.text == "Underweight"{
                cupNumberLabel.text = "3"
                gramNumberLabel.text = "384"
            }else if weightIndicatorLabel.text == "Ideal"{
                cupNumberLabel.text = "2.25"
                gramNumberLabel.text = "288"
            }else if weightIndicatorLabel.text == "Overweight"{
                cupNumberLabel.text = "1.5"
                gramNumberLabel.text = "192"
            }
        }
        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.weightLabel.frame.origin.y += CGFloat(self.yChange)
            self.weightNumberLabel.frame.origin.y += CGFloat(self.yChange)
            self.kgLabel.frame.origin.y += CGFloat(self.yChange)
            self.weightIndicatorLabel.frame.origin.y += CGFloat(self.yChange)
            self.indicatorToTheRightImageView.frame.origin.y += CGFloat(self.yChange)
            self.currentLabel.frame.origin.y += CGFloat(self.yChange)
            self.idealLineView.frame.origin.y += CGFloat(self.yChange)
            
            self.indicatorToTheLeftImageView.frame.origin.y -= CGFloat(self.yChange)
            self.cupNumberLabel.frame.origin.y -= CGFloat(self.yChange)
            self.cupLabel.frame.origin.y -= CGFloat(self.yChange)
            self.slashLabel.frame.origin.y -= CGFloat(self.yChange)
            self.gramNumberLabel.frame.origin.y -= CGFloat(self.yChange)
            self.gramLabel.frame.origin.y -= CGFloat(self.yChange)
            self.kcalAmountLabel.frame.origin.y -= CGFloat(self.yChange)
            self.idealLabel.frame.origin.y -= CGFloat(self.yChange)
            self.currentLineView.frame.origin.y -= CGFloat(self.yChange)
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
