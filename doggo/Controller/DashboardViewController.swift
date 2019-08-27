//
//  DashboardViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UIScrollViewDelegate {
    
    // Element
    @IBOutlet weak var yellowCircle: UIView!
    
    // Data and Texts
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    
    var slides:[PhotoSlide] = [];
    
    @IBOutlet weak var dogScrollView: UIScrollView!
    @IBOutlet weak var dogPageControl: UIPageControl!
    @IBOutlet weak var bubbleMessage: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var groomingButton: UIButton!
    @IBOutlet weak var checkUpButton: UIButton!
    
    // Labels and Icons
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var foodScheduleMainLabel: UILabel!
    @IBOutlet weak var foodScheduleSecondaryLabel: UILabel!
    @IBOutlet weak var groomingScheduleMainLabel: UILabel!
    @IBOutlet weak var groomingScheduleSecondaryLabel: UILabel!
    @IBOutlet weak var checkUpMainLabel: UILabel!
    @IBOutlet weak var checkUpSecondaryLabel: UILabel!
    
    @IBOutlet weak var foodIcon: UIImageView!
    @IBOutlet weak var foodIconLabel: UILabel!
    @IBOutlet weak var groomingIcon: UIImageView!
    @IBOutlet weak var groomingIconLabel: UILabel!
    @IBOutlet weak var checkUpIcon: UIImageView!
    @IBOutlet weak var checkUpIconLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yellowCircle.layer.cornerRadius = yellowCircle.frame.width / 2
        
        // Setting up dog's name and breed
        setDogName()
        
        // Setting up scroll view for dog lists
        dogScrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        dogPageControl.numberOfPages = slides.count
        dogPageControl.currentPage = 0
        view.bringSubviewToFront(dogPageControl)
        
        view.bringSubviewToFront(dogName)
        view.bringSubviewToFront(dogBreed)
        view.bringSubviewToFront(yellowCircle)
        view.bringSubviewToFront(bubbleMessage)
        view.bringSubviewToFront(bubbleView)
        view.bringSubviewToFront(scheduleLabel)
        view.bringSubviewToFront(foodButton)
        view.bringSubviewToFront(groomingButton)
        view.bringSubviewToFront(checkUpButton)
        view.bringSubviewToFront(foodScheduleMainLabel)
        view.bringSubviewToFront(foodScheduleSecondaryLabel)
        view.bringSubviewToFront(foodIcon)
        view.bringSubviewToFront(foodIconLabel)
        view.bringSubviewToFront(groomingScheduleMainLabel)
        view.bringSubviewToFront(groomingScheduleSecondaryLabel)
        view.bringSubviewToFront(groomingIcon)
        view.bringSubviewToFront(groomingIconLabel)
        view.bringSubviewToFront(checkUpMainLabel)
        view.bringSubviewToFront(checkUpSecondaryLabel)
        view.bringSubviewToFront(checkUpIcon)
        view.bringSubviewToFront(checkUpIconLabel)
        
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
        // Go to Food page
    }
    
    @IBAction func groomPageButton(_ sender: Any) {
        // Go to Grooming page
    }
    
    @IBAction func checkUpPageButton(_ sender: Any) {
        // Go to Check Up page
    }
    
////////////////////////////////////////////////////////////////////
    
    func createSlides() -> [PhotoSlide] {
        
        let slide1:PhotoSlide = Bundle.main.loadNibNamed("PhotoSlide", owner: self, options: nil)?.first as! PhotoSlide
        slide1.dogImage.image = UIImage(named: "labrador_retriever_PNG81")
        
        let slide2:PhotoSlide = Bundle.main.loadNibNamed("PhotoSlide", owner: self, options: nil)?.first as! PhotoSlide
        slide2.dogImage.image = UIImage(named: "labrador_retriever_PNG81")
        
        let slide3:PhotoSlide = Bundle.main.loadNibNamed("PhotoSlide", owner: self, options: nil)?.first as! PhotoSlide
        slide3.dogImage.image = UIImage(named: "labrador_retriever_PNG81")
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [PhotoSlide]) {
        dogScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        dogScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        dogScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            dogScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        dogPageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
    }
    
//////////////////////////////////////////////////////////////////////
    
    
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
        bubbleLayer.lineWidth = 3
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
