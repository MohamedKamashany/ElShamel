//
//  VideoTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 08/01/2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var videoLbl: UILabel!
    @IBOutlet weak var sectionLbl: UILabel!
    @IBOutlet weak var chapterLbl: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config() {
        containerView.layer.cornerRadius = 10
        chapterLbl.textColor = UIColor(red: 122.0/255, green: 120.0/255, blue: 120.0/255, alpha: 1)
    }
    
}
