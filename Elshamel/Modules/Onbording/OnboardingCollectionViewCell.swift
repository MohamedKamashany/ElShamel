//
//  OnboardingCollectionViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 11/01/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var slideImage: UIImageView!
    
    func setup(_ slide: OnbordingSlids) {
        slideImage.image = slide.image
        mainLbl.text = slide.title
        descriptionLbl.text = slide.descripition
    }

}
