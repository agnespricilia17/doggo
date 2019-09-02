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
    
    @IBOutlet weak var breedImage: UIImageView!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    var isMale : Bool?
    
    
    var transferedBreedName:String?
    var transferedBreedImage:UIImage?
    
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
        else if dobField.text == "" || !isYearValid(chosenDate: datePicker!.date){
            let dobAlert = UIAlertController(title: "Date of Birth required.", message: "You need to fill your dog's birth date.", preferredStyle: .alert)
            
            if dobField.text == "" {
                dobAlert.message = "You need to fill your dog's birth date."
            }
            else {
                dobAlert.title = "Date invalid."
                dobAlert.message = "Are you from the future?"
            }
            dobAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(dobAlert, animated: true)
        }
        else if weightField.text == "" || !isNumericalOnly(text: weightField.text!) {
            let weightAlert = UIAlertController(title: "Weight required.", message: "Your dog's weight is out of the world.", preferredStyle: .alert)
            
            if weightField.text == "" {
                weightAlert.message = "You need to fill your dog's weight."
            }
            else {
                weightAlert.title = "Weight invalid."
                weightAlert.message = "Your dog's weight should be numerical only."
            }
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
        //print(Date())
        breedImage.image = transferedBreedImage
        breedLabel.text = transferedBreedName
        yellowCircle.layer.cornerRadius = yellowCircle.frame.width/2
        // Do any additional setup after loading the view.
        
        registerDone.layer.cornerRadius = registerDone.frame.size.height/2
        registerDone.clipsToBounds = true
        registerDone.layer.borderWidth = 1
        registerDone.layer.borderColor = #colorLiteral(red: 0, green: 0.4745098039, blue: 1, alpha: 1)
       
        //pick dob
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(RegisterViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        dobField.inputView = datePicker
        
        //input weight
     // weightField.delegate = self
        weightField.keyboardType = UIKeyboardType.numberPad
//      createWeightPicker()
        
        //keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object:nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object:nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func confirmRegistration() {
        performSegue(withIdentifier: "goToDashboard", sender: self)
        
    }
    
    // Check whether a string only has number or not
    func isNumericalOnly(text: String) -> Bool {
        guard let convertedString = Int(text) else { return false }
        
        print(convertedString)
        
        return true
    }
    
 
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dobField.text = dateFormatter.string(from: datePicker.date)
       // view.endEditing(true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 210.5
            }
    }
    
    func showKeyboard(offset: CGFloat) {
        var reducedValue:CGFloat = 300 - offset
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= reducedValue
            }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func isYearValid(chosenDate: Date/*, date2: Date, nYears: Int*/) -> Bool {
        let todayDate = Date()
        
        if chosenDate > todayDate {
            return false
        }
        
        return true
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
