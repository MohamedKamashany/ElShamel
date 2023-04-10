//
//  SubscriptionTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/04/2023.
//

import UIKit

class SubscriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var subscripLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var subscripImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var LELbl: UILabel!
    @IBOutlet weak var subscripButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config() {
        subscripImageView.image = UIImage(named: "Monthly subscription")
        subscripButton.layer.cornerRadius = 15
        subscripButton.layer.shadowColor = #colorLiteral(red: 0.008414091542, green: 0.3898709118, blue: 0.6640194058, alpha: 1)
        subscripButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        subscripButton.layer.shadowOpacity = 0.4
    }
    
    @IBAction func subscripBtn(_ sender: Any) {
    }
    
}
