//
//  ChooseBreedViewController.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit

class ChooseBreedViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var breedScrollView: UIScrollView!
    @IBOutlet weak var askBreedLabel: UILabel!
    
    var slides:[breedSlide] = []
    
    func createSlides() -> [breedSlide] {
        let slide1:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide1.breedView.image = UIImage(named: "beagle")
        slide1.breedName.text = "Beagle"
        slide1.breedDesc.text = ""
        
        let slide2:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide2.breedView.image = UIImage(named: "border collie")
        slide2.breedName.text = "Border Collie"
        slide2.breedDesc.text = ""
        
        let slide3:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide3.breedView.image = UIImage(named: "dachshund")
        slide3.breedName.text = "Dachshund"
        slide3.breedDesc.text = ""
        
        let slide4:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide4.breedView.image = UIImage(named: "golden retriever")
        slide4.breedName.text = "Golden Retriever"
        slide4.breedDesc.text = ""
        
        let slide5:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide5.breedView.image = UIImage(named: "great dane")
        slide5.breedName.text = "Great Dane"
        slide5.breedDesc.text = ""
        
        let slide6:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide6.breedView.image = UIImage(named: "maltese")
        slide6.breedName.text = "Maltese"
        slide6.breedDesc.text = ""
        
        let slide7:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide7.breedView.image = UIImage(named: "pomeranian")
        slide7.breedName.text = "Pomeranian"
        slide7.breedDesc.text = ""
        
        let slide8:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide8.breedView.image = UIImage(named: "pug")
        slide8.breedName.text = "Pug"
        slide8.breedDesc.text = ""
        
        let slide9:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide9.breedView.image = UIImage(named: "siberian husky")
        slide9.breedName.text = "Siberian Husky"
        slide9.breedDesc.text = ""
        
        let slide10:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide10.breedView.image = UIImage(named: "st. bernard")
        slide10.breedName.text = "St. Bernard"
        slide10.breedDesc.text = ""
        
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9, slide10]
    }
    
    func setupSlideScrollView(slides : [breedSlide]) {
        breedScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        breedScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        breedScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            breedScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        //pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextButton.layer.cornerRadius = nextButton.frame.size.height/2
        nextButton.clipsToBounds = true
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.blue.cgColor
        
        self.breedScrollView.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)

        view.bringSubviewToFront(askBreedLabel)
        view.bringSubviewToFront(nextButton)

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
