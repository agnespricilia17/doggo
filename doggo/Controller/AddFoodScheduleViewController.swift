//
//  AddFoodScheduleViewController.swift
//  doggo
//
//  Created by Owen Prasetya on 27/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class AddFoodScheduleViewController: UIViewController {

    @IBOutlet weak var foodDatePicker: UIDatePicker!
    
    @IBOutlet weak var timeTitle1: UILabel!
    @IBOutlet weak var timeTitle2: UILabel!
    @IBOutlet weak var timeTitle3: UILabel!
    @IBOutlet weak var timeTitle4: UILabel!
    
    @IBOutlet weak var timeButton1: UIButton!
    @IBOutlet weak var timeButton2: UIButton!
    @IBOutlet weak var timeButton3: UIButton!
    @IBOutlet weak var timeButton4: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    var focusedView = 0
    
    let timeFormatter = DateFormatter()
    
    var strDate = String()
    
    var countSet = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Food"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveFoodSchedule))
        
        timeFormatter.timeStyle = DateFormatter.Style.short
        
        strDate = timeFormatter.string(from: foodDatePicker.date)

        // Do any additional setup after loading the view.
        timeButton1.layer.cornerRadius = timeButton1.frame.height/2.5
        
        label2.isEnabled = false
        timeTitle2.isEnabled = false
        timeButton2.layer.cornerRadius = timeButton2.frame.height/2.5
        timeButton2.isEnabled = false
        timeButton2.alpha = 0.4
        
        label3.isEnabled = false
        timeTitle3.isEnabled = false
        timeButton3.layer.cornerRadius = timeButton3.frame.height/2.5
        timeButton3.isEnabled = false
        timeButton3.alpha = 0.4
        
        label4.isEnabled = false
        timeTitle4.isEnabled = false
        timeButton4.layer.cornerRadius = timeButton4.frame.height/2.5
        timeButton4.isEnabled = false
        timeButton4.alpha = 0.4
        
    }
    
    @objc func saveFoodSchedule() {
        // Saving to core data
        /* Write here*/
        let savedString1 = self.label1.text
        let userDefaults1 = Foundation.UserDefaults.standard
        userDefaults1.set(savedString1, forKey: "Food 1")
        let savedString2 = self.label2.text
        let userDefaults2 = Foundation.UserDefaults.standard
        userDefaults2.set(savedString2, forKey: "Food 2")
        let savedString3 = self.label3.text
        let userDefaults3 = Foundation.UserDefaults.standard
        userDefaults3.set(savedString3, forKey: "Food 3")
        let savedString4 = self.label4.text
        let userDefaults4 = Foundation.UserDefaults.standard
        userDefaults4.set(savedString4, forKey: "Food 4")
        
        /*dismiss(animated: true, completion: nil)*/
        print("save tapped")
        
        let alert = UIAlertController(title: "Saved", message: "Data successfully saved.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok"
            , style: .default
            , handler: { (UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
        }))
        
        
        let not = NotificationHelper()
        
        not.scheduleTimedNotification(data: NotificationData(title: "Feed me!", content: "Henlo! It’s time for me to eat. Pwease give me some food!😞 ", duration: nil, isRepeating: false),isActionable: true, date: foodDatePicker.date)
        
        self.present(alert, animated: true)
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        strDate = timeFormatter.string(from: foodDatePicker.date)
        print(strDate)
        
        if focusedView == 3 || (countSet == 3 && label4.isEnabled == true) {
//            timeButton4.titleLabel?.text = strDate
//            timeButton4.titleLabel?.textAlignment = .center
            label4.text = strDate
        }
        else if focusedView == 2 || (countSet == 2 && label3.isEnabled == true) {
//            timeButton3.titleLabel?.text = strDate
//            timeButton3.titleLabel?.textAlignment = .center
            label3.text = strDate
        }
        else if focusedView == 1 || (countSet == 1 && label2.isEnabled == true) {
//            timeButton2.titleLabel?.text = strDate
//            timeButton2.titleLabel?.textAlignment = .center
            label2.text = strDate
        }
        else if focusedView == 0 {
//            timeButton1.titleLabel?.text = strDate
//            timeButton1.titleLabel?.textAlignment = .center
            label1.text = strDate
        }

        enableAdditionalSchedule()
    }
    
    @IBAction func timeButton1Tapped(_ sender: UIButton) {
        focusedView = sender.tag
        timeButton1.layer.borderColor = UIColor.black.cgColor
        timeButton1.layer.borderWidth = 2
        timeButton2.layer.borderColor = UIColor.clear.cgColor
        timeButton3.layer.borderColor = UIColor.clear.cgColor
        timeButton4.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func timeButton2Tapped(_ sender: UIButton) {
        focusedView = sender.tag
        timeButton2.layer.borderColor = UIColor.black.cgColor
        timeButton2.layer.borderWidth = 2
        timeButton1.layer.borderColor = UIColor.clear.cgColor
        timeButton3.layer.borderColor = UIColor.clear.cgColor
        timeButton4.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func timeButton3Tapped(_ sender: UIButton) {
        focusedView = sender.tag
        timeButton3.layer.borderColor = UIColor.black.cgColor
        timeButton3.layer.borderWidth = 2
        timeButton2.layer.borderColor = UIColor.clear.cgColor
        timeButton1.layer.borderColor = UIColor.clear.cgColor
        timeButton4.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func timeButton4Tapped(_ sender: UIButton) {
        focusedView = sender.tag
        timeButton4.layer.borderColor = UIColor.black.cgColor
        timeButton4.layer.borderWidth = 2
        timeButton2.layer.borderColor = UIColor.clear.cgColor
        timeButton3.layer.borderColor = UIColor.clear.cgColor
        timeButton1.layer.borderColor = UIColor.clear.cgColor
    }
    
    func enableAdditionalSchedule() {
        // Validate if user has chosen at least the 1st schedule
        if label1.text != "" && countSet == 0 {
            timeButton2.alpha = 1.0
            timeButton2.isEnabled = true
            
            countSet += 1
        }
        // Validate for further adding schedule
        else if label2.text != "" && countSet == 1 {
            timeTitle2.isEnabled = true
            label2.isEnabled = true
            timeButton3.isEnabled = true
            timeButton3.alpha =  1.0
            
            countSet += 1
        }
        else if label3.text != "" && countSet == 2 {
            timeTitle3.isEnabled = true
            label3.isEnabled = true
            timeButton4.isEnabled = true
            timeButton4.alpha = 1.0
            
            countSet += 1
        }
        else if label4.text != "" && countSet == 3 {
            timeTitle4.isEnabled = true
            label4.isEnabled = true
            
            countSet += 1
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
