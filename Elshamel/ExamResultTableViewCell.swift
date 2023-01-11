//
//  ExamResultTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/01/2023.
//

import UIKit

class ExamResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var studentNameLbl: UILabel!
    @IBOutlet weak var unitLevelLbl: UILabel!
    @IBOutlet weak var percentageLbl: UILabel!
    @IBOutlet weak var sentResultButton: UIButton!
    @IBOutlet weak var sentResultButton2: UIButton!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config() {
        containerView.layer.cornerRadius = 10
    }
    
    @IBAction func sentResultBtn(_ sender: Any) {
    }

    
}
