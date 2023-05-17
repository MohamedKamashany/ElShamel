//
//  TextAnswerCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/05/2023.
//

import UIKit

class TextAnswerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var answerTextLabel: UILabel!
    @IBOutlet weak var checedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(with answer: Answers) {
        answerTextLabel.text = answer.body
        
        if answer.is_selected ?? false {
            checedImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline (1)")
        }else {
            checedImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline")
        }
    }
    
    @IBAction func chooseAnswerBtn(_ sender: Any) {
//        if isChecked {
//            checkBoxImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline (1)")
//            isChecked = false
//        } else {
//            checkBoxImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline")
//            isChecked = true
//        }
    }
}
