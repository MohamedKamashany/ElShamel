//
//  HorizontalView.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit

class AnswerImageView: UIView {
    
    @IBOutlet weak var answarImage: UIImageView!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    
    var unchecked = true

    private static let NIB_NAME: String = "AnswerImageView"
    
    private static var viewFromXib: AnswerImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    static func commonInit() -> AnswerImageView? {
         viewFromXib = Bundle.main.loadNibNamed(NIB_NAME, owner: self, options: nil)![0] as? AnswerImageView
         return viewFromXib
    }
    
    @IBAction func chooseAnswerBtn(_ sender: Any) {
        if unchecked {
            checkBoxImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline (1)")
            unchecked = false
        } else {
            checkBoxImageView.image = UIImage(named: "Icon ionic-ios-checkbox-outline")
            unchecked = true
        }
    }


}
