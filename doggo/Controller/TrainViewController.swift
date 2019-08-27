//
//  TrainViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class TrainViewController: UIViewController {

    @IBOutlet weak var pottyButton: UIButton!
    @IBOutlet weak var handShakeButton: UIButton!
    @IBOutlet weak var sitButton: UIButton!
    @IBOutlet weak var haltButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    
    var titleForNextPage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func pottyButtonTapped(_ sender: Any) {
        titleForNextPage = "Potty"
        performSegue(withIdentifier: "trainDetailSegue", sender: self)

    }
    @IBAction func handShakeButtonTapped(_ sender: Any) {
        titleForNextPage = "Hand Shake"
        performSegue(withIdentifier: "trainDetailSegue", sender: self)
        
    }
    @IBAction func sitButtonTapped(_ sender: Any) {
        titleForNextPage = "Sit"
        performSegue(withIdentifier: "trainDetailSegue", sender: self)
        
    }
    @IBAction func haltButtonTapped(_ sender: Any) {
        titleForNextPage = "Halt"
        performSegue(withIdentifier: "trainDetailSegue", sender: self)
    }
    @IBAction func standButtonTapped(_ sender: Any) {
        titleForNextPage = "Stand"
        performSegue(withIdentifier: "trainDetailSegue", sender: self)
    }
    @IBAction func callButtonTapped(_ sender: Any) {
        titleForNextPage = "Call"
        performSegue(withIdentifier: "trainDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "trainDetailSegue"{
            var vc = segue.destination as! TrainDetailViewController
            vc.titlePage = titleForNextPage
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
