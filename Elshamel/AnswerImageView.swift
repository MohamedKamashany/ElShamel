//
//  HorizontalView.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit

class AnswerImageView: UIView {

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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
