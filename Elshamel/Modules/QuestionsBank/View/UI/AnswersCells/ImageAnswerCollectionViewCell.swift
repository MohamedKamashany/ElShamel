//
//  ImageAnswerCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit
import SDWebImage

class ImageAnswerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var checedImageView: UIImageView!
    @IBOutlet weak var answerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(with answer: Answers) {
        guard let imageURLStr = answer.image else {
            answerImageView.image = UIImage(named: "")
            return
        }
        
        answerImageView.sd_setImage(with: URL(string: imageURLStr),
                                    placeholderImage: UIImage(named: ""),
                                    options: .lowPriority,
                                    context: nil)
        
        if answer.is_selected ?? false {
            checedImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline (1)")
        }else {
            checedImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline")
        }
    }
    
    @IBAction func checkedBtn(_ sender: Any) {
        
    }
    //    func instanceFromNib() -> HorizontalView {
//        guard let view = UINib(nibName: "HorizontalView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? HorizontalView else { fatalError() }
//        return view
//    }
    
}
