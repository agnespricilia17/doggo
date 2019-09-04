//
//  DashboardViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UIScrollViewDelegate {

    // Data and Texts
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    
    var slides:[PhotoSlide] = [];
    
    @IBOutlet weak var dogScrollView: UIScrollView!
    @IBOutlet weak var dogPageControl: UIPageControl!
    
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        UserDefaults.standard.set(true, forKey: "hasLaunched")
        
        let coreDataHelper = CoreDataHelper()
        dogs = coreDataHelper.fetch(entityName: "Dog")
//        for dog in dogs! {
//            print("Name  \(dog.name)")
//            print("Birth  \(dog.birthdate)")
//            print("Bre  \(dog.breed)")
//            print("Siz  \(dog.size)")
//            print("Gen  \(dog.gender)")
//            print("Pic  \(dog.picture)")
//        }
        
        // Setting up initial dog's name and breed
        setDogName(name: dogs[dogPageControl.currentPage].name!, breed: dogs[dogPageControl.currentPage].breed!)
        
        // Setting up scroll view for dog lists
        dogScrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        // Set up page control
        dogPageControl.numberOfPages = slides.count
        view.bringSubviewToFront(dogPageControl)
        
        // Bringing all the elements in front of the new scrollview xib
        view.bringSubviewToFront(dogName)
        view.bringSubviewToFront(dogBreed)
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
        //createBubbleShape(view: bubbleView)
        //produceBubbleMessage(text: "Hey Doggo")
        
        // Do any additional setup after loading the view.
        foodButton.layer.cornerRadius = 10
        groomingButton.layer.cornerRadius = 10
        checkUpButton.layer.cornerRadius = 10
        
        // Set up navigation bar item for adding new dog
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewDogButton))
        
//        load userfoundation
        let userFoodSchedule1 = Foundation.UserDefaults.standard
        let valueFoodSchedule1 = userFoodSchedule1.string(forKey: "Food 1") ?? ""
//        if valueFoodSchedule1 > 0{
//        }
        let userFoodSchedule2 = Foundation.UserDefaults.standard
        let valueFoodSchedule2 = userFoodSchedule2.string(forKey: "Food 2") ?? ""
        let userFoodSchedule3 = Foundation.UserDefaults.standard
        let valueFoodSchedule3 = userFoodSchedule3.string(forKey: "Food 3") ?? ""
        let userFoodSchedule4 = Foundation.UserDefaults.standard
        let valueFoodSchedule4 = userFoodSchedule4.string(forKey: "Food 4") ?? ""
        if valueFoodSchedule1 != ""{
            if valueFoodSchedule2 != "" {
                foodScheduleSecondaryLabel.text = "\(valueFoodSchedule2)  \(valueFoodSchedule3)  \(valueFoodSchedule4)"
            }
            foodScheduleMainLabel.text = "\(valueFoodSchedule1)"
        }else{
            foodScheduleSecondaryLabel.text = "00:00  00:00  00:00"
            foodScheduleMainLabel.text = "00:00"
        }
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        let formattedDate = format.string(from: date)
        
        let userGroomDateSchedule = Foundation.UserDefaults.standard
        let valueGroomDateSchedule = userGroomDateSchedule.string(forKey: "Groom Date") ?? ""
        let userGroomTimeSchedule = Foundation.UserDefaults.standard
        let valueGroomTimeSchedule = userGroomTimeSchedule.string(forKey: "Groom Time") ?? ""
        if valueGroomTimeSchedule != ""{
            groomingScheduleSecondaryLabel.text = "\(valueGroomTimeSchedule)"
            groomingScheduleMainLabel.text = "\(valueGroomDateSchedule)"
        }else{
            groomingScheduleSecondaryLabel.text = "00:00"
            groomingScheduleMainLabel.text = formattedDate
        }
        
        let userCheckUpDateSchedule = Foundation.UserDefaults.standard
        let valueCheckUpDateSchedule = userCheckUpDateSchedule.string(forKey: "Check Up Date") ?? ""
        let userCheckUpTimeSchedule = Foundation.UserDefaults.standard
        let valueCheckUpTimeSchedule = userCheckUpTimeSchedule.string(forKey: "Check Up Time") ?? ""
        if valueCheckUpTimeSchedule != ""{
            checkUpSecondaryLabel.text = "\(valueCheckUpTimeSchedule)"
            checkUpMainLabel.text = "\(valueCheckUpDateSchedule)"
        }else{
            checkUpSecondaryLabel.text = "00:00"
            checkUpMainLabel.text = formattedDate
        }
    }
    
    func setDogName(name: String, breed: String) {
        dogName.text = name
        dogBreed.text = breed
    }
    
    // Adding new dog to the list
    @objc func addNewDogButton() {
        performSegue(withIdentifier: "addNewDogSegue", sender: self)
        
    }
    
    @IBAction func foodPageButton(_ sender: Any) {
        // Go to Food page
        performSegue(withIdentifier: "goToAddFoodSchedule", sender: self)
        
    }
    
    @IBAction func groomPageButton(_ sender: Any) {
        // Go to Grooming page
        performSegue(withIdentifier: "goToAddGroomingSchedule", sender: self)
    }
    
    @IBAction func checkUpPageButton(_ sender: Any) {
        // Go to Check Up page
        performSegue(withIdentifier: "goToAddCheckUpSchedule", sender: self)
    }
    
////////////////////////////////////////////////////////////////////
    
    func createSlides() -> [PhotoSlide] {
        var dogSlides:[PhotoSlide] = []
        for dog in dogs {
            let slide:PhotoSlide = Bundle.main.loadNibNamed("PhotoSlide", owner: self, options: nil)?.first as! PhotoSlide
            print("The PIC : \(dog.picture!)")
            slide.dogImage.image = UIImage(named: dog.picture!)
            slide.yellowBackground.layer.cornerRadius = slide.yellowBackground.frame.width/2
            slide.dogName = dog.name
            slide.dogBreed = dog.breed
            
//            if dog.size! == "Toy" {
//                slide.bubbleView.frame.origin.y = 280
//                slide.bubbleLabel.frame.origin.y = 280
//            }
//            else if dog.size! == "Small" {
//                slide.bubbleView.frame.origin.y = 260
//                slide.bubbleLabel.frame.origin.y = 260
//            }
//            else if dog.size! == "Medium" {
//                slide.bubbleView.frame.origin.y = 240
//                slide.bubbleLabel.frame.origin.y = 240
//            }
//            else if dog.size! == "Large" {
//                slide.bubbleView.frame.origin.y = 220
//                slide.bubbleLabel.frame.origin.y = 220
//            }
            
            dogSlides.append(slide)
        }
        print(dogSlides)
        return dogSlides
    }
    
    func setupSlideScrollView(slides : [PhotoSlide]) {
        dogScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        dogScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        dogScrollView.isPagingEnabled = true
        
        // Setting inset to fix the image in place
        dogScrollView.contentInset.top = 0
        dogScrollView.contentInset.bottom = 0
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            dogScrollView.addSubview(slides[i])
            
            // Set up bubble
            slides[i].bubbleView.image = UIImage(named: "speech bubble")
            slides[i].bubbleLabel.text = "Feed me bitj"
            //slides[i].bringSubviewToFront(slides[i].bubbleLabel)
            
            if dogs[i].size! == "Toy" {
                if dogs[i].breed! == "Pomeranian" || dogs[i].breed! == "Maltese" {
                    slides[i].bubbleView.frame.origin.x -= 24
                }
                
                slides[i].bubbleView.frame.origin.y = 255
            }
            else if dogs[i].size! == "Small" {
//                if dogs[i].breed! == "Beagle" {
//                    slides[i].bubbleView.frame.origin.x -= 16
//                }
                
                slides[i].bubbleView.frame.origin.y = 230
            }
            else if dogs[i].size! == "Medium" {
                if dogs[i].breed! == "Border Collie" {
                    slides[i].bubbleView.frame.origin.x -= 16
                }
                else if dogs[i].breed! == "German Shepherd" {
                    slides[i].bubbleView.frame.origin.x -= 20
                }
                
                slides[i].bubbleView.frame.origin.y = 185
            }
            else if dogs[i].size! == "Large" {
                if dogs[i].breed! == "St. Bernard" {
                    slides[i].bubbleView.frame.origin.x -= 8
                }
                slides[i].bubbleView.frame.origin.y = 165
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        dogPageControl.currentPage = Int(pageIndex)
        currentDog = dogPageControl.currentPage
        let currentChosenDog = slides[dogPageControl.currentPage]
        setDogName(name: currentChosenDog.dogName, breed: currentChosenDog.dogBreed)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = 0
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
//////////////////////////////////////////////////////////////////////
    
    
//    func createBubbleShape(view: UIView) {
//        let width = view.frame.width
//        let height = view.frame.height
//
//        let bubbleLayer = CAShapeLayer()
//
//        // Create the path to make bubble
//        let bezierPath = UIBezierPath()
//
//        bezierPath.move(to: CGPoint(x: 22, y: height))
//        bezierPath.addLine(to: CGPoint(x: width - 17, y: height))
//        bezierPath.addCurve(to: CGPoint(x: width, y: height - 17), controlPoint1: CGPoint(x: width - 7.61, y: height), controlPoint2: CGPoint(x: width, y: height - 7.61))
//        bezierPath.addLine(to: CGPoint(x: width, y: 17))
//        bezierPath.addCurve(to: CGPoint(x: width - 17, y: 0), controlPoint1: CGPoint(x: width, y: 7.61), controlPoint2: CGPoint(x: width - 7.61, y: 0))
//        bezierPath.addLine(to: CGPoint(x: 21, y: 0))
//        bezierPath.addCurve(to: CGPoint(x: 4, y: 17), controlPoint1: CGPoint(x: 11.61, y: 0), controlPoint2: CGPoint(x: 4, y: 7.61))
//        bezierPath.addLine(to: CGPoint(x: 4, y: height - 11))
//        bezierPath.addCurve(to: CGPoint(x: 0, y: height), controlPoint1: CGPoint(x: 4, y: height - 1), controlPoint2: CGPoint(x: 0, y: height))
//        bezierPath.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
//        bezierPath.addCurve(to: CGPoint(x: 11.04, y: height - 4.04), controlPoint1: CGPoint(x: 4.07, y: height + 0.43), controlPoint2: CGPoint(x: 8.16, y: height - 1.06))
//        bezierPath.addCurve(to: CGPoint(x: 22, y: height), controlPoint1: CGPoint(x: 16, y: height), controlPoint2: CGPoint(x: 19, y: height))
//
//
//        bezierPath.close()
//        bezierPath.fill()
//
//        bubbleLayer.strokeColor = UIColor.red.cgColor
//        bubbleLayer.lineWidth = 3
//        bubbleLayer.fillColor = UIColor.clear.cgColor
//        bubbleLayer.path = bezierPath.cgPath
//
//        view.layer.addSublayer(bubbleLayer)
//        view.bringSubviewToFront(bubbleMessage)
//    }
//
//    // Create bubble message; *set for daily random message*
//    func produceBubbleMessage(text: String) {
//        //  bubbleMessage.numberOfLines = 0
//        //  bubbleMessage.font = UIFont.systemFont(ofSize: 14)
//        //  bubbleMessage.textColor = .black
//        bubbleMessage.text = text
//
//        let constraintRect = CGSize(width: 0.66 * view.frame.width,
//                                    height: .greatestFiniteMagnitude)
//        let boundingBox = text.boundingRect(with: constraintRect,
//                                            options: .usesLineFragmentOrigin,
//                                            attributes: [.font: bubbleMessage.font!],
//                                            context: nil)
//        bubbleMessage.frame.size = CGSize(width: ceil(boundingBox.width),
//                                  height: ceil(boundingBox.height))
//
//    //  let bubbleSize = CGSize(width: bubbleMessage.frame.width + 2,
//    //                                height: bubbleMessage.frame.height + 2)
//    //
//    //  bubbleView.frame.size = bubbleSize
//
//    //  bubbleMessage.center = bubbleView.center
//        print(bubbleMessage.text)
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     */

}
