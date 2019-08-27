//
//  DashboardViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    // Element
    @IBOutlet weak var yellowCircle: UIView!

    @IBOutlet weak var dogListControl: UIPageControl!
    
    // Data and Texts
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    
    @IBOutlet weak var bubbleMessage: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yellowCircle.layer.cornerRadius = yellowCircle.frame.width / 2
        
        setDogName()
        
        // Set the text to be displayed in bubble here
        createBubbleShape(view: bubbleView)
        produceBubbleMessage(text: "Feed me bitjh!")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setDogName() {
        dogName.text = "Fluffy Bun"
        dogBreed.text = "Golden Retriever"
    }
    
    @IBAction func foodPageButton(_ sender: Any) {
        
    }
    
    @IBAction func groomPageButton(_ sender: Any) {
        
    }
    
    @IBAction func checkUpPageButton(_ sender: Any) {
        
    }
    
    
    func createBubbleShape(view: UIView) {
        let width = view.frame.width
        let height = view.frame.height
        
        let bubbleLayer = CAShapeLayer()
        
        // Create the path to make bubble
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: CGPoint(x: 22, y: height))
        bezierPath.addLine(to: CGPoint(x: width - 17, y: height))
        bezierPath.addCurve(to: CGPoint(x: width, y: height - 17), controlPoint1: CGPoint(x: width - 7.61, y: height), controlPoint2: CGPoint(x: width, y: height - 7.61))
        bezierPath.addLine(to: CGPoint(x: width, y: 17))
        bezierPath.addCurve(to: CGPoint(x: width - 17, y: 0), controlPoint1: CGPoint(x: width, y: 7.61), controlPoint2: CGPoint(x: width - 7.61, y: 0))
        bezierPath.addLine(to: CGPoint(x: 21, y: 0))
        bezierPath.addCurve(to: CGPoint(x: 4, y: 17), controlPoint1: CGPoint(x: 11.61, y: 0), controlPoint2: CGPoint(x: 4, y: 7.61))
        bezierPath.addLine(to: CGPoint(x: 4, y: height - 11))
        bezierPath.addCurve(to: CGPoint(x: 0, y: height), controlPoint1: CGPoint(x: 4, y: height - 1), controlPoint2: CGPoint(x: 0, y: height))
        bezierPath.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
        bezierPath.addCurve(to: CGPoint(x: 11.04, y: height - 4.04), controlPoint1: CGPoint(x: 4.07, y: height + 0.43), controlPoint2: CGPoint(x: 8.16, y: height - 1.06))
        bezierPath.addCurve(to: CGPoint(x: 22, y: height), controlPoint1: CGPoint(x: 16, y: height), controlPoint2: CGPoint(x: 19, y: height))
        
        
        bezierPath.close()
        bezierPath.fill()
        
        bubbleLayer.strokeColor = UIColor.red.cgColor
        bubbleLayer.lineWidth = 1
        bubbleLayer.fillColor = UIColor.clear.cgColor
        bubbleLayer.path = bezierPath.cgPath
        
        view.layer.addSublayer(bubbleLayer)
        view.bringSubviewToFront(bubbleMessage)
    }
    
    // Create bubble message; *set for daily random message*
    func produceBubbleMessage(text: String) {
//        bubbleMessage.numberOfLines = 0
//        bubbleMessage.font = UIFont.systemFont(ofSize: 14)
//        bubbleMessage.textColor = .black
        bubbleMessage.text = text
        
        let constraintRect = CGSize(width: 0.66 * view.frame.width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: bubbleMessage.font!],
                                            context: nil)
        bubbleMessage.frame.size = CGSize(width: ceil(boundingBox.width),
                                  height: ceil(boundingBox.height))
        
//        let bubbleSize = CGSize(width: bubbleMessage.frame.width + 2,
//                                height: bubbleMessage.frame.height + 2)
//
//        bubbleView.frame.size = bubbleSize
        
//        bubbleMessage.center = bubbleView.center
        print(bubbleMessage.text)
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
