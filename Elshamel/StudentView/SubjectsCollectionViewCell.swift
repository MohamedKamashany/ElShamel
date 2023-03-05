//
//  SubjectsCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 24/01/2023.
//

import UIKit

class SubjectsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setContainerView()
    }
    
    func setContainerView() {
        containerView.layer.cornerRadius = 10
        //        containerView.layer.masksToBounds = true
        // containerView.layer.shadowOffset = CGSize(width: 20, height: 50)
        //containerView.layer.shadowOpacity = 0.9
    }
}
