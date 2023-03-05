//
//  CollectionViewCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var checedImageView: UIImageView!
    
    var unchecked = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let horizontalView = instanceFromNib()
//        self.addSubview(horizontalView)
    }
    
    @IBAction func checkedBtn(_ sender: Any) {
        if unchecked{
            checedImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline (1)")
            unchecked = false
        } else {
            checedImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline")
            unchecked = true
        }
    }
    //    func instanceFromNib() -> HorizontalView {
//        guard let view = UINib(nibName: "HorizontalView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? HorizontalView else { fatalError() }
//        return view
//    }
    
}
