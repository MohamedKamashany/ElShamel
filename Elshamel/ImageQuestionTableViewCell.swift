//
//  ImageQuestionTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit

class ImageQuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config() {
        for _ in 0..<3 {
            if let selectItem = AnswerImageView.commonInit() {
                stackView.addArrangedSubview(selectItem)
            }
        }
    }
}
