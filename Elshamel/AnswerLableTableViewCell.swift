//
//  Select.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/01/2023.
//

import UIKit

class AnswerLableTableViewCell: UIView {
    
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    
    var unchecked = true
    
    private static let NIB_NAME: String = "AnswerLableTableViewCell"
    
    private static var viewFromXib: AnswerLableTableViewCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Signleton object from Select.
    
     static func commonInit() -> AnswerLableTableViewCell? {
         viewFromXib = Bundle.main.loadNibNamed(NIB_NAME, owner: self, options: nil)![0] as? AnswerLableTableViewCell
         return viewFromXib
    }
    
    func config(with optionName: String) {
        lable.text = optionName
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
