//
//  PropertyRightsViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 22/04/2023.
//

import UIKit

class PropertyRightsViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var propertyRightsLbl: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var propertyRightsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
