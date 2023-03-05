//
//  NotificationTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/01/2023.
//

import UIKit

protocol NotficationDelegat {
     func delete()
}

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var notificationImageVIew: UIImageView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var notificationLable: UILabel!
    @IBOutlet weak var timeLbl: UIImageView!
    
    var delete: () -> () = {}
    // var loginBtnClicked: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config() {
        containerView.layer.cornerRadius = 10
        exitButton.backgroundColor = AppColors.backgroundcolor
    }
    
    @IBAction func exitBtn(_ sender: Any) {
        delete()
    }
}
