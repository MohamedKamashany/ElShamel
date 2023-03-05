//
//  Subject.swift
//  Elshamel
//
//  Created by mohamed rafik on 12/01/2023.
//

import UIKit

class SubjectViewController: UIViewController {

    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var elbabLbl: UILabel!
    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var chapterLbl: UILabel!
    @IBOutlet weak var chapterContainer: UIView!
    @IBOutlet weak var whatDoYouWantLbl: UILabel!
    
    @IBOutlet weak var watchVideoLBl: UILabel!
    @IBOutlet weak var watchVideoButton: UIButton!
    @IBOutlet weak var questionBankLbl: UILabel!
    @IBOutlet weak var questionBankButton: UIButton!
    @IBOutlet weak var examsLbl: UILabel!
    @IBOutlet weak var examsButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var selectOptionsStack: UIStackView!
    
    var checked = true
    
    let optionsNames: [String] = [ "مشاهدة فيديو", "بنك الاسئلة", "امتحانات" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutContainer()
        setBtn()
        createOptions()
    }
    
    func createOptions() {
        for index in 0..<3 {
            if let selectItem = AnswerLableTableViewCell.commonInit() {
                selectItem.config(with: optionsNames[index])
                selectOptionsStack.addArrangedSubview(selectItem)
            }
        }
    }
    
    func layoutContainer() {
        firstContainer.layer.cornerRadius = 10
        chapterContainer.layer.cornerRadius = 10
    }
    
    func setBtn() {
        nextButton.layer.cornerRadius = 20
        nextButton.layer.borderColor = AppColors.borderColor.cgColor
        nextButton.layer.borderWidth = 1
        nextButton.layer.shadowColor = AppColors.borderColor.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        nextButton.layer.shadowOpacity = 0.4
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func chosePartBtn(_ sender: Any) {
    }
    
    @IBAction func choseChapterBtn(_ sender: Any) {
        
    }
    
    @IBAction func watchVideoBtn(_ sender: Any) {
        if checked {
            watchVideoButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline"), for: .normal)
            checked = false
        } else{
            watchVideoButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline (1)"), for: .normal)
            checked = true
        }
    }
    
    @IBAction func questionBankBtn(_ sender: Any) {
        if checked == false{
            questionBankButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline"), for: .normal)
            checked = true
        }else{
            questionBankButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline (1)"), for: .normal)
            checked = false
        }
    }
    
    @IBAction func examsBtn(_ sender: Any) {
        if checked {
            examsButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline"), for: .normal)
            checked = false
        } else {
            examsButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline (1)"), for: .normal)
            checked = true
        }
    }
    
    @IBAction func nextBtn(_ sender: Any) {
    }
    
    
}
