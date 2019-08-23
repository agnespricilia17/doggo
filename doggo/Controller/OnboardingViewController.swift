//
//  OnBoardingViewController.swift
//  doggo
//
//  Created by Ivan Sebastian on 21/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
  
    @IBOutlet weak var pageControl: UIPageControl!
    
     var slides:[Slide] = [];
  
    let btnNew = UIButton()
    
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "onboarding 1")
        slide1.titleLabel.text = "Take care of your dog."
        slide1.descLabel.text = "Check your dog's daily needs."
        slide1.btnStart.isHidden = true
        
        let slide2:Slide = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "onboarding 2")
        slide2.titleLabel.text = "Get notification."
        slide2.descLabel.text = "Never again will you forget to take care of your dog."
        slide2.btnStart.isHidden = true
        
        let slide3:Slide = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "onboarding 3")
        slide3.titleLabel.text = "Keep track of your actions."
        slide3.descLabel.text = "Confirm your action buy checking to-do list."
        slide3.btnStart.isEnabled = true
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        slides[2].btnStart.addTarget(self, action: #selector(gotoRegister), for: .touchDown)
        scrollView.delegate = self
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
  
    }
    
    @objc func gotoRegister() {
        performSegue(withIdentifier: "gotoRegister", sender: self)
    }

   
}
