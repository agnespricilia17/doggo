//
//  RegisterViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var yellowCircle: UIView!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var registerDone: UIButton!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var dobField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    @IBOutlet weak var weightField: UITextField!
    var activeTextField : UITextField!
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    var isMale : Bool?
    
    
    var breedName : String = ""
    var breedImage:String = ""
    
    @IBAction func maleChoose(_ sender: Any) {
        isMale = true
        maleButton.frame = CGRect(x: 178, y: 636, width: 28, height: 28)
        maleButton.setImage(UIImage(named: "male icon bold"), for: .normal)
        femaleButton.frame = CGRect(x: 248, y: 636, width: 20, height: 28)
        femaleButton.setImage(UIImage(named: "women gender"), for: .normal)
    
        
    }
    
    @IBAction func femaleChoose(_ sender: Any) {
        isMale = false
        femaleButton.frame = CGRect(x: 248, y: 636, width: 20, height: 28)
        femaleButton.setImage(UIImage(named: "female icon bold"), for: .normal)
        maleButton.frame = CGRect(x: 178, y: 636, width: 28, height: 28)
        maleButton.setImage(UIImage(named: "male gender"), for: .normal)
    
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        if nameField.text == "" {
            let nameAlert = UIAlertController(title: "Name required.", message: "You need to fill your dog's name.", preferredStyle: .alert)
            nameAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(nameAlert, animated: true)
        }
        else if isMale == nil {
            let genderAlert = UIAlertController(title: "Gender required.", message: "You need to choose your dog's gender.", preferredStyle: .alert)
            genderAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(genderAlert, animated: true)
        }
        else if dobField.text == "" {
            let dobAlert = UIAlertController(title: "Date of Birth required.", message: "You need to fill your dog's birth date.", preferredStyle: .alert)
            dobAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(dobAlert, animated: true)
        }
        else if weightField.text == "" {
            let weightAlert = UIAlertController(title: "Weight required.", message: "You need to fill your dog's weight.", preferredStyle: .alert)
            weightAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(weightAlert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Confirmation", message: "Do you want to save this data? Please make sure the data is correct.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Register"
                , style: .default
                , handler: { (UIAlertAction) in
                    self.confirmRegistration()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
       
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yellowCircle.layer.cornerRadius = yellowCircle.frame.width/2
        // Do any additional setup after loading the view.
        
        registerDone.layer.cornerRadius = registerDone.frame.size.height/2
        registerDone.clipsToBounds = true
        registerDone.layer.borderWidth = 1
        registerDone.layer.borderColor = UIColor.blue.cgColor
       
        //pick dob
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(RegisterViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapDobGesture = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapDobGesture)
        
        dobField.inputView = datePicker
        
        //input weight
     // weightField.delegate = self
        weightField.keyboardType = UIKeyboardType.numberPad
//        createWeightPicker()
        
       
        
    }
    
    func confirmRegistration() {
        performSegue(withIdentifier: "goToDashboard", sender: self)
        
    }
    
 
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dobField.text = dateFormatter.string(from: datePicker.date)
       // view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
   
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return weightKg.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return weightKg[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectedWeight = weightKg[row]
//        weightField.text = selectedWeight
//    }
//
//    func createWeightPicker() {
//        let weightPicker = UIPickerView()
//        weightPicker.delegate = self
//
//        weightField.inputView = weightPicker
//    }
//
//
//
//    var selectedWeight : String?
//
//    var weightKg = ["23", "24", "25", "26"]
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
