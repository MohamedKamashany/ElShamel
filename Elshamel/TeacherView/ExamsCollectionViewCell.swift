//
//  ExamsCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 23/01/2023.
//

import UIKit

class ExamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var examImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContainerView() {
        containerView.layer.cornerRadius = 10
//        containerView.layer.masksToBounds = true
       // containerView.layer.shadowOffset = CGSize(width: 20, height: 50)
        //containerView.layer.shadowOpacity = 0.9
    }

}
