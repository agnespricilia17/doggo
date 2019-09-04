//
//  AddCheckUpScheduleViewController.swift
//  doggo
//
//  Created by Owen Prasetya on 27/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class AddCheckUpScheduleViewController: UIViewController {

    @IBOutlet weak var checkUpDatePicker: UIDatePicker!
    
    let timeFormatter = DateFormatter()
    var strDate = String()
    var strTime = String()
    
    @IBOutlet weak var dateBack: UIButton!
    @IBOutlet weak var timeBack: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Check Up"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCheckUpSchedule))
        
        // Do any additional setup after loading the view.
        dateBack.layer.cornerRadius = dateBack.frame.height/2.5
        timeBack.layer.cornerRadius = timeBack.frame.height/2.5
    }
    
    @objc func saveCheckUpSchedule() {
        // Saving to core data
        /* Write here*/
        let savedString1 = self.dateLabel.text
        let userDefaults1 = Foundation.UserDefaults.standard
        userDefaults1.set(savedString1, forKey: "Check Up Date")
        let savedString2 = self.timeLabel.text
        let userDefaults2 = Foundation.UserDefaults.standard
        userDefaults2.set(savedString2, forKey: "Check Up Time")
        print("save check up")
        /*dismiss(animated: true, completion: nil)*/
        let alert = UIAlertController(title: "Saved", message: "Data successfully saved.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok"
            , style: .default
            , handler: { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
        }))
        
        let not = NotificationHelper()
        
        not.scheduleTimedNotification(data: NotificationData(title: "Am I okay?", content: "Henlo, i’m not feeling gewd!🤢 Bwing me to the doctor pwease!", duration: nil, isRepeating: false),isActionable: true, date: checkUpDatePicker.date)
        self.present(alert, animated: true)
        
    }
    
    @IBAction func dateValueChanged(_ sender: Any) {
        timeFormatter.dateStyle = DateFormatter.Style.short
        timeFormatter.dateFormat = "dd/MM/yyyy"
        strDate = timeFormatter.string(from: checkUpDatePicker.date)
        dateLabel.text = strDate
        
        timeFormatter.timeStyle = DateFormatter.Style.short
        timeFormatter.dateFormat = "HH:mm a"
        strTime = timeFormatter.string(from: checkUpDatePicker.date)
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
