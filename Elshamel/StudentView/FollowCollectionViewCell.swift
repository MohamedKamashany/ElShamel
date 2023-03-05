//
//  FollowCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 24/01/2023.
//

import UIKit

class FollowCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoNameLbl: UILabel!
    @IBOutlet weak var videoDateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
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
