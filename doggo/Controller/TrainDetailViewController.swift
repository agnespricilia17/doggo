//
//  TrainDetailViewController.swift
//  doggo
//
//  Created by Evan Christian on 23/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class TrainDetailViewController: UIViewController {

    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var playImageView: UIImageView!
    var titlePage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titlePage
        // Do any additional setup after loading the view.
        if title == "Potty"{
            print("Potty wewew")
        }else if title == "Hand Shake"{
            print("Hand Shake asdad")
        }else if title == "Sit"{
            print("Sit wewewqwe")
        }else if title == "Halt"{
            print("Halt ioejroi")
        }else if title == "Stand"{
            print("Stand irjtr")
        }else if title == "Call"{
            print("Call qqqq")
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
