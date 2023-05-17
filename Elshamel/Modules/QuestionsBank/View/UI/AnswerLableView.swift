//
//  Select.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/01/2023.
//

import UIKit

class AnswerLableView: UICollectionViewCell {
    
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var unchecked = true
    
    private static let NIB_NAME: String = "AnswerLableView"
    
    private static var viewFromXib: AnswerLableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Signleton object from Select.
    
     static func commonInit() -> AnswerLableView? {
         viewFromXib = Bundle.main.loadNibNamed(NIB_NAME, owner: self, options: nil)![0] as? AnswerLableView
         return viewFromXib
    }
    
    func config(with optionName: Answers) {
        lable.text = optionName.body
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
