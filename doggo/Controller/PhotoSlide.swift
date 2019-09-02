//
//  SlideView.swift
//  doggo
//
//  Created by Owen Prasetya on 27/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class PhotoSlide: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var yellowBackground: UIView!
    
    var dogName:String!
    var dogBreed:String!
}




