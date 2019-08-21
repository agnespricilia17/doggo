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
    @IBAction func registerButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Confirmation", message: "Do you want to save this data? Please make sure the data is correct.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Register"
            , style: .default
            , handler: { (UIAlertAction) in
                self.confirmRegistration()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yellowCircle.layer.cornerRadius = yellowCircle.frame.width/2
        // Do any additional setup after loading the view.
        
        registerDone.layer.cornerRadius = registerDone.frame.size.height/2
        registerDone.clipsToBounds = true
        registerDone.layer.borderWidth = 1
        registerDone.layer.borderColor = UIColor.blue.cgColor
       
        
    }
    func confirmRegistration() {
        performSegue(withIdentifier: "goToDashboard", sender: self)
        
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
