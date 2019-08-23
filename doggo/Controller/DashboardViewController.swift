//
//  DashboardViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var yellowCircle: UIView!
    
    @IBOutlet weak var dogListControl: UIPageControl!
    
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yellowCircle.layer.cornerRadius = yellowCircle.frame.width / 2
        
        
        // Do any additional setup after loading the view.
    }
    
    func setDogName() {
        dogName.text = "Fluffy Bun"
        dogBreed.text = "Golden Retriever"
    }
    
    @IBAction func foodPageButton(_ sender: Any) {
        
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
