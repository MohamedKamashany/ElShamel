//
//  ImageQuestionTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit
import SDWebImage

class ImageQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionNameLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answerNameLbl: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    var optionsName = [Answers]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config() {
        stackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        for index in 0..<optionsName.count {
            if let selectItem = AnswerLableView.commonInit() {
                selectItem.config(with: optionsName[index])
                stackView.addArrangedSubview(selectItem)
            }
        }
    }
    
    func setQuestions(_ questions: Questions?) {
        questionNameLbl.text = questions?.title
        questionLbl.text = questions?.body
        questionImageView.sd_setImage(with: URL(string: questions?.image ?? ""), placeholderImage: UIImage(named: ""))
        self.optionsName = questions?.answers ?? []
    }
    
}
