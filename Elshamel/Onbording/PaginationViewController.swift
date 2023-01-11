//
//  PaginationViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/01/2023.
//

import UIKit

class PaginationViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnbordingSlids] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                skip.setTitle("تخطي", for: .normal)
            }else {
                skip.setTitle("تخطي", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        
        slides = [OnbordingSlids(title: "سهولة التطبيق", descripition: "تطبيق الشامل اونلاين سهل بواجه مستخدم ذكيه تتيح لك الوصول للمعلومه بشكل سريع وبدون اخطاء", image: UIImage(named: "Ease of application")!),
                  OnbordingSlids(title: "تحسين الوصول للمعلومة", descripition: "من خلال تقسيم التطبيق للمواد والشرح ستستطيع الوصل للمعلومه بشكل سهل مع امكانيه التصحيح الالكتروني و استكمال الشرح في اي وقت", image: UIImage(named: "Improving access to information")!),
                  OnbordingSlids(title: "شرح فيديو وافي", descripition: "شرح فيديو لكل درس يأخدك نحو التفوق", image: UIImage(named: "Full video explanation")!),
                  OnbordingSlids(title: "امتحانات و مراجعات", descripition: "كم هائل من الأسئلة و الامتحانات مع تنوع في طرح الأفكار المختلفة طبقا لتعديلات وزارة التربية و التعليم الاخيره", image: UIImage(named: "Exams and reviews")!)
        ]
    }
    
    @IBAction func skipBtn(_ sender: Any) {
        if currentPage == slides.count - 1 {
            print("Go To the next page")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
//        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//            let width = scrollView.frame.width
//            currentPage = Int(scrollView.contentOffset.x/width)
//        }
}
//__________________________________________________________________________________
struct OnbordingSlids {
    let title: String
    let descripition: String
    let image: UIImage
}
//_____________________________________________________________________________________
extension PaginationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
   
