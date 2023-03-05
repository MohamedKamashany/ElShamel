//
//  MyStudentsCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 23/01/2023.
//

import UIKit

class MyStudentsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var studentnameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContainerView() {
        containerView.layer.cornerRadius = 10
//        containerView.layer.masksToBounds = true
       // containerView.layer.shadowOffset = CGSize(width: 20, height: 50)
        //containerView.layer.shadowOpacity = 0.9
    }

}
