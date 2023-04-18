//
//  QuestionsBankTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 12/01/2023.
//

import UIKit

class QuestionsBankTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionNameLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answerNameLbl: UILabel!
    
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerOneLbl: UILabel!
    @IBOutlet weak var answerTwoLBl: UILabel!
    @IBOutlet weak var answerThreeLbl: UILabel!
    
    @IBOutlet weak var stacView: UIStackView!
    
    var unchecked = true
    let optionsName: [String] = ["الألم بحد ذاته ممتع ، لقد كان أسهل ، لكن كان من الأسهل التخلص من حادثة عصب الأذن ؟",
                                 "الألم بحد ذاته ممتع ، لقد كان أسهل ، لكن كان من الأسهل التخلص من حادثة عصب الأذن ؟",
                                 "الألم بحد ذاته ممتع ، لقد كان أسهل ، لكن كان من الأسهل التخلص من حادثة عصب الأذن ؟"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config() 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config() {
        for index in 0..<3 {
            if let selectItem = AnswerLableTableViewCell.commonInit() {
                selectItem.config(with: optionsName[index])
                stacView.addArrangedSubview(selectItem)
            }
        }
    }
    
    
    
    
    @IBAction func answerOneBtn(_ sender: Any) {
        if unchecked{
            answerOneButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline (1)"), for: .normal)
            unchecked = false
        } else {
            answerOneButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline"), for: .normal)
            unchecked = true
        }
    }
    
    @IBAction func answerTwoBtn(_ sender: Any) {
        if unchecked{
            answerTwoButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline (1)"), for: .normal)
            unchecked = false
        } else {
            answerTwoButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline"), for: .normal)
            unchecked = true
        }
    }
    
    @IBAction func answerThreeBtn(_ sender: Any) {
        if unchecked{
            answerThreeButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline (1)"), for: .normal)
            unchecked = false
        } else {
            answerThreeButton.setImage(UIImage(named: "Icon ionic-ios-checkbox-outline"), for: .normal)
            unchecked = true
        }
    }
}
