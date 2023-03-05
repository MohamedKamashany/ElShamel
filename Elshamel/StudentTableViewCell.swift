//
//  StudentTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 04/01/2023.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImg: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var studentDegreeLbl: UILabel!
    @IBOutlet weak var studentNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config() {
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }
    
}
