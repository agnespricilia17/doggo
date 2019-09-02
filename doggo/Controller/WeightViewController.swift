//
//  WeightViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController {
    
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dogBreedLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var currentWeightLabel: UILabel!
    @IBOutlet weak var underweightAmountLabel: UILabel!
    @IBOutlet weak var idealAmountLabel: UILabel!
    @IBOutlet weak var overweightAmountLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var dogWeightInfoLabel: UILabel!
    
    @IBOutlet weak var chartView: UIView!
    
    //    var gradientLayer: CAGradientLayer!
    
    var myMutableString = NSMutableAttributedString()
    
    var infoString:String = ""
    var currentWeight = 0
    var dataEntries:[DogChartData] = [
        //DogChartData(color: UIColor.red, height: Float.random(in: 0.1...1), textValue: String(currentWeight), title: todayDateLabel!.text!)
    ]
    var dogWeights:[Weight] = []
    
    var chart:ChartView?
    
    func updateTable() {
        for dogWeight in dogWeights {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "dd/MM/yyyy"
            if dateFormat.string(from: dogWeight.date!) == dateFormat.string(from: Date()) {
                currentWeightLabel.text = String(dogWeight.amount)
                currentWeight = Int(dogWeight.amount)
            }
            dataEntries.append(DogChartData(color: UIColor.red, height: Float.random(in: 0.1...1), textValue: String(dogWeight.amount), title: dateFormat.string(from: dogWeight.date!)))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dogWeights = dogs[currentDog].weightOfDog?.allObjects as! [Weight]
        dataEntries.removeAll()
        updateTable()
        chart!.updateDataEntries(dataEntries: dataEntries, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weight"
        
        dogNameLabel.text = dogs[currentDog].name
        dogBreedLabel.text = dogs[currentDog].breed
        
        chartView.backgroundColor = .white
        chartView.layer.borderWidth = 2.0
        chartView.layer.borderColor = UIColor.blue.cgColor
        chart = ChartView(frame: CGRect(x: 0, y: 0, width: chartView.frame.maxX, height: 300))
        
        self.chartView.addSubview(chart!)
        
        weightSlider.value = Float(currentWeight)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        todayDateLabel.text = formattedDate
        
        if weightSlider.value < 34{
            infoString = "Your dog needs to gain more weight!"
            myMutableString = NSMutableAttributedString(string: infoString)
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:18,length:17))
            dogWeightInfoLabel.attributedText = myMutableString
            dogWeightInfoLabel.text = infoString
            //            weightSlider.thumbTintColor = UIColor(displayP3Red: CGFloat(weightSlider.value / 100), green: CGFloat(weightSlider.value / 100), blue: 1, alpha: 1)
        }else if weightSlider.value > 66{
            infoString = "Your dog needs to lose some weight!"
            myMutableString = NSMutableAttributedString(string: infoString)
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:18,length:17))
            dogWeightInfoLabel.attributedText = myMutableString
            dogWeightInfoLabel.text = infoString
            //            weightSlider.thumbTintColor = UIColor(displayP3Red: 1, green: CGFloat(weightSlider.value / 100), blue: CGFloat(weightSlider.value / 100), alpha: 1)
        }else{
            infoString = "Your dog's weight is ideal"
            myMutableString = NSMutableAttributedString(string: infoString)
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:21,length:5))
            dogWeightInfoLabel.attributedText = myMutableString
            dogWeightInfoLabel.text = infoString
            //            weightSlider.thumbTintColor = UIColor(displayP3Red: CGFloat(weightSlider.value / 100), green: 1, blue: CGFloat(weightSlider.value / 100), alpha: 1)
        }
        //weightSlider thumb custom image
        for state: UIControl.State in [.normal, .selected, .application, .reserved] {
            
            //            weightSlider.setThumbImage(UIImage(named: "Oval"), for: state)
            
        }
        
        //fetch dog name dan tampilkan
        //        dogNameLabel.text =
        //fetch dog breed dan tampilkan
        //        dogBreedLabel.text = ""
        //fetch dog weight dan tampilkan
        //        currentWeightLabel.text =
        
        //underweightnya anjing breed itu brapa, dkk
        //        underweightAmountLabel.text =
        //        idealAmountLabel.text =
        //        overweightAmountLabel.text =
        
        // Do any additional setup after loading the view.
        //        createGradientLayer()
        //        let layer = CAGradientLayer()
        //        layer.frame = CGRect(x: 64, y: 64, width: 160, height: 160)
        //        layer.colors = [UIColor.red.cgColor, UIColor.black.cgColor]
        //        view.layer.addSublayer(layer)
        //        weightSlider.minimumTrackTintColor =
    }
    
    //    func createGradientLayer() {
    //        gradientLayer = CAGradientLayer()
    //
    //        gradientLayer.frame = self.view.bounds
    //
    //        gradientLayer.colors = [UIColor.red, UIColor.yellow]
    //        print("test")
    //        self.view.layer.addSublayer(gradientLayer)
    //        print("test2")
    //    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @objc func addTapped(){
        self.performSegue(withIdentifier: "addWeightSegue", sender: self)
    }
    
}
