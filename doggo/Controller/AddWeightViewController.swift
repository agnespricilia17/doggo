//
//  AddWeightViewController.swift
//  doggo
//
//  Created by Evan Christian on 02/09/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class AddWeightViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var weightDatePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightButton: UIButton!
    
    let timeFormatter = DateFormatter()
    var strDate = String()
    var strTime = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add Weight"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        weightTextField.delegate = self
        weightTextField.keyboardType = UIKeyboardType.numberPad
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func weightDatePickerValueChanged(_ sender: Any) {
        timeFormatter.dateStyle = DateFormatter.Style.short
        timeFormatter.dateFormat = "dd/MM/yyyy"
        strDate = timeFormatter.string(from: weightDatePicker.date)
        dateLabel.text = strDate
        
        timeFormatter.timeStyle = DateFormatter.Style.short
        timeFormatter.dateFormat = "HH:mm a"
        strTime = timeFormatter.string(from: weightDatePicker.date)
        timeLabel.text = strTime
    }
    @objc func addTapped(){
//        self.performSegue(withIdentifier: "addWeightSegue", sender: self)
        let alert = UIAlertController(title: "No weight found", message: "Insert your dog's weight.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok"
            , style: .default
            , handler: nil))
        
        if weightTextField.text != "" {
            let coreDataHelper = CoreDataHelper()
            let weightValue = Int(weightTextField.text!)
            let currentDate = Date()
            let updatedWeight = WeightModel(amount: weightValue!, date: weightDatePicker.date)
            coreDataHelper.addWeight(entityName: "Dog", searchString: dogs[currentDog].name!, updatedWeight: updatedWeight)
            navigationController?.popViewController(animated: true)
        }
        else {
            self.present(alert, animated: true)
        }
    }
    
//    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
//        view.endEditing(true)
//    }
}
