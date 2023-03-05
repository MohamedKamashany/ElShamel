//
//  FinalResultViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/01/2023.
//

import UIKit

class FinalResultViewController: UIViewController {

    @IBOutlet weak var backGroundIMg: UIImageView!
    @IBOutlet weak var resultIcon: UIImageView!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var getLbl: UILabel!
    @IBOutlet weak var percentageLbl: UILabel!
    @IBOutlet weak var seeCorectButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var choseOntherChabter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtns()
        percentageLbl.textColor = UIColor(red: 145.0/255, green: 145.0/255, blue: 145.0/255, alpha: 1)
    }
    
    func setBtns() {
        homeButton.layer.cornerRadius = 20
        homeButton.layer.borderColor = AppColors.borderColor.cgColor
        homeButton.layer.borderWidth = 1
        homeButton.layer.shadowColor = AppColors.borderColor.cgColor
        homeButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        homeButton.layer.shadowOpacity = 0.4

        choseOntherChabter.layer.cornerRadius = 20
        choseOntherChabter.layer.borderWidth = 1
        choseOntherChabter.layer.borderColor = AppColors.borderColor.cgColor
        choseOntherChabter.layer.shadowColor = AppColors.borderColor.cgColor
        choseOntherChabter.layer.shadowOffset = CGSize(width: 3, height: 3)
        choseOntherChabter.layer.shadowOpacity = 0.4
    }
    
    @IBAction func homeBtn(_ sender: Any) {
    }
    
    @IBAction func ontherChabterBtn(_ sender: Any) {
    }
    
}
