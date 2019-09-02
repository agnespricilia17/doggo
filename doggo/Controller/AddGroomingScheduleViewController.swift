//
//  AddGroomingScheduleViewController.swift
//  doggo
//
//  Created by Owen Prasetya on 27/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class AddGroomingScheduleViewController: UIViewController {

    @IBOutlet weak var groomingDatePicker: UIDatePicker!
    
    let timeFormatter = DateFormatter()
    var strDate = String()
    var strTime = String()
    
    @IBOutlet weak var dateBack: UIButton!
    @IBOutlet weak var timeBack: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Grooming"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveGroomingSchedule))
        
        // Do any additional setup after loading the view.
        dateBack.layer.cornerRadius = dateBack.frame.height/2.5
        timeBack.layer.cornerRadius = timeBack.frame.height/2.5
    }
    
    @objc func saveGroomingSchedule() {
        // Saving to core data
        /* Write here*/
        let savedString1 = self.dateLabel.text
        let userDefaults1 = Foundation.UserDefaults.standard
        userDefaults1.set(savedString1, forKey: "Groom Date")
        let savedString2 = self.timeLabel.text
        let userDefaults2 = Foundation.UserDefaults.standard
        userDefaults2.set(savedString2, forKey: "Groom Time")
        print("save groom")
        /*dismiss(animated: true, completion: nil)*/
    }
    
    @IBAction func dateValueChanged(_ sender: Any) {
        timeFormatter.dateStyle = DateFormatter.Style.short
        timeFormatter.dateFormat = "dd/MM/yyyy"
        strDate = timeFormatter.string(from: groomingDatePicker.date)
        dateLabel.text = strDate
        
        timeFormatter.timeStyle = DateFormatter.Style.short
        timeFormatter.dateFormat = "HH:mm a"
        strTime = timeFormatter.string(from: groomingDatePicker.date)
        timeLabel.text = strTime
        
        print(strDate)
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
