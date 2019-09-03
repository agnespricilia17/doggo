//
//  HealthViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class HealthViewController: UIViewController {
    @IBOutlet weak var groomButton: UIButton!
    @IBOutlet weak var vetCheckButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        groomButton.layer.cornerRadius = 10
        vetCheckButton.layer.cornerRadius = 10
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
