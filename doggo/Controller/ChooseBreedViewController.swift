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
        slide1.breedView.image = UIImage(named: "beagle asset")
        slide1.breedName.text = "Beagle"
        slide1.breedDesc.text = "Gentle and outgoing, great for any family.  Beagle is an easygoing dog that perfect for companion for big families and new dog owners. Small dog category. Hound blood gives the a loyal and tenacious character."
        
        let slide2:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide2.breedView.image = UIImage(named: "border collie asset")
        slide2.breedName.text = "Border Collie"
        slide2.breedDesc.text = "A medium dog category. Known for his intense stare which control his flock. Unlimited energy, stamina and working drive. Highly trainable and intelligent."
        
        let slide3:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide3.breedView.image = UIImage(named: "dachshund asset")
        slide3.breedName.text = "Dachshund"
        slide3.breedDesc.text = "The dachsund, small dog category known as  “Wiener dog” or “Sausage dog”. Loveable little dog, charming with their spunk. Retain low body and cleverness required."
        
        let slide4:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide4.breedView.image = UIImage(named: "german shepherd asset")
        slide4.breedName.text = "German Shepherd"
        slide4.breedDesc.text = "They are intelligent and capable working dogs. They are amazingly versatile, excelling at most they are trained. Usually help at police and military service, herding, search, rescue and drug detection."
        
        let slide5:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide5.breedView.image = UIImage(named: "golden retriever asset")
        slide5.breedName.text = "Golden Retriever"
        slide5.breedDesc.text = "A very loyal family dog. Medium dog category. Suitable for intermediate to expert. Cold climate and regular brushing required."
        
        let slide6:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide6.breedView.image = UIImage(named: "great dane asset")
        slide6.breedName.text = "Great Dane"
        slide6.breedDesc.text = "A loveable giant, know for having a heart of gold. These fun fogs, offering a good combination of overall calm and jovialty. This dog quite handful for families."
        
        let slide7:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide7.breedView.image = UIImage(named: "maltese asset")
        slide7.breedName.text = "Maltese"
        slide7.breedDesc.text = "Maltese, a toy category is known as a playful and affectionate. Their long and straight fur is daunting to many owners who fear grooming responsibilities. They are low-shedding and long lived."
        
        let slide8:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide8.breedView.image = UIImage(named: "pomeranian asset")
        slide8.breedName.text = "Pomeranian"
        slide8.breedDesc.text = "Huge fluffy coat to match its larger-than life personality, make Pomeranian is one of the most popular small dog breeds. Goofy and alert personality. "
        
        let slide9:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide9.breedView.image = UIImage(named: "pug asset")
        slide9.breedName.text = "Pug"
        slide9.breedDesc.text = "The Pug is timeless staple, beloved by many owners and admires. Pugs are some of the sturdier toy dogs. Their ridiculously cute appearance and outgoing personality make them fabulous pets."
        
        let slide10:breedSlide = Bundle.main.loadNibNamed("breedSlideView", owner: self, options: nil)?.first as! breedSlide
        slide10.breedView.image = UIImage(named: "st.bernard asset")
        slide10.breedName.text = "St. Bernard"
        slide10.breedDesc.text = "Dog breed that used as a guard dog. This dog help find and save lost and injured people. This breed versatile and excels show ring and in obedience trials and weight pulling competition."
        
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
    
    var offsetXSebelumnya:CGFloat = 0
    var kiriAtauKanan:String = ""
    var kiriAtauKananSebelumnya:String = ""
    var namaAnjingSekarang: String = ""
    var currentPos:Int = 0
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        offsetXSebelumnya = scrollView.contentOffset.x
    }
    
    var prevX:CGFloat = 0
    var currentX:CGFloat = 0
    var dogName = ""
    var dogPic:UIImage?
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
        
       // print("X SBELUMNYA :  \(offsetXSebelumnya)")
       // print("X SEKARANG : \(scrollView.contentOffset.x)")
        
//        if currentPos != 0 && currentPos != slides.count-1{
//            if scrollView.contentOffset.x < offsetXSebelumnya{
//                print("kiri")
//                if kiriAtauKanan == "kiri" && kiriAtauKananSebelumnya != kiriAtauKanan{
//                    currentPos -= 1
//                    if currentPos < 0{
//                        currentPos = 0
//                    }
//                    namaAnjingSekarang = slides[currentPos].breedName.text ?? "gagal"
//                    kiriAtauKananSebelumnya = kiriAtauKanan
//                }else{
//                    kiriAtauKanan = "kiri"
//                }
//            }
//            if scrollView.contentOffset.x > offsetXSebelumnya{
//                print("kanan")
//                if kiriAtauKanan == "kanan" && kiriAtauKananSebelumnya != kiriAtauKanan{
//                    currentPos += 1
//                    if currentPos > slides.count-1{
//                        currentPos = slides.count-1
//                    }
//                    namaAnjingSekarang = slides[currentPos].breedName.text ?? "gagal"
//                    kiriAtauKananSebelumnya = kiriAtauKanan
//                }else{
//                    kiriAtauKanan = "kanan"
//                }
//            }
//            print(namaAnjingSekarang)
//        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        prevX = currentX
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //kiriAtauKananSebelumnya = ""
        currentX = scrollView.contentOffset.x
        let jarakAntarSlide = 414
        var perbedaan = Int(abs(currentX - prevX))
        print(perbedaan)
        print("Prev : \(prevX)")
        print("Current : \(currentX)")
        
        let extra = perbedaan / jarakAntarSlide
        print("extra :\(extra)")
        if perbedaan >= jarakAntarSlide {
            selectedBreed(extra: extra)
        }
        else if perbedaan <= jarakAntarSlide {
            selectedBreed(extra: extra)
        }
    }
    
    func selectedBreed(extra: Int) {
        if currentX > prevX {
            
            if currentPos > slides.count - 1 {
                currentPos = slides.count - 1
            }else {
                currentPos += extra
                print("kanan curpos : \(currentPos)")
            }
            
            
        }
        else if currentX < prevX {
            
            if currentPos > slides.count - 1 {
                currentPos = slides.count - 1
            }
            else {
                currentPos -= extra
                print("kiri curpos : \(currentPos)")
            }
        }
        dogName = slides[currentPos].breedName.text ?? "AAAA"
        dogPic = slides[currentPos].breedView.image ?? nil
        
        print(dogName)
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
        dogName = slides[0].breedName.text ?? "AA"

        view.bringSubviewToFront(askBreedLabel)
        view.bringSubviewToFront(nextButton)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerSegue"{
            var vc = segue.destination as! RegisterViewController
            vc.transferedBreedName = dogName
            vc.transferedBreedImage = dogPic
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
