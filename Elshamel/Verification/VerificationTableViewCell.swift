//
//  verificationTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 02/01/2023.
//

import UIKit
import AROTPTextField

protocol VerificationDelegat {
    func verification()
}


class VerificationTableViewCell: UITableViewCell, AROTPTextFieldDelegate {
    
    @IBOutlet weak var verificationEmailLbl: UILabel!
    @IBOutlet weak var verificationImageView: UIImageView!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var verificationBtn: UIButton!
    @IBOutlet weak var otpTxt: AROTPTextField!
    
    var delegat: VerificationDelegat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBtn()
        setTxt()
    }
    
    func isFinishedEnteringCode(isFinished: Bool) {
        otpTxt.isEnabled = true
        otpTxt.alpha = 0.4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func didUserFinishEnter(the code: String) {
        print(code)
    }
    
    func config() {
        
    }
    
    func setBtn() {
        verificationBtn.layer.cornerRadius = 18
//        verificationBtn.layer.masksToBounds = false
        verificationBtn.layer.shadowColor = UIColor(red: 3.0/255, green: 99.0/255, blue: 169.0/255, alpha: 1.0).cgColor
        verificationBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        verificationBtn.layer.shadowOpacity = 0.4
    }
    
    func setTxt() {
        otpTxt.otpBackgroundColor = UIColor.lightText
        //otpTxt.otpFilledBackgroundColor = UIColor(red: 212, green: 228, blue: 241, alpha: 1)
        otpTxt.otpTextColor = UIColor(red: 37.0/255, green: 91.0/255, blue: 105.0/255, alpha: 1)
        otpTxt.otpDefaultBorderColor = UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 1)
        otpTxt.otpDefaultBorderWidth = 1
        otpTxt.otpFilledBorderColor = .white
        otpTxt.otpFilledBorderWidth = 2
        otpTxt.otpFont = UIFont.systemFont(ofSize: 30)
        otpTxt.otpCornerRaduis = 7.55
        otpTxt.defaultCharacter = ""
        otpTxt.otpDelegate = self
        otpTxt.alpha = 0.4
        otpTxt.configure()
    }
    
    @IBAction func resendBtn(_ sender: Any) {
    }
    
    @IBAction func verificationBtn(_ sender: Any) {
        delegat?.verification()
    }
    
}
