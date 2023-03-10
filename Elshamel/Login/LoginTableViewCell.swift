//
//  LoginTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit
import Alamofire
import SwiftyJSON


protocol loginDelegat {
    func register()
    func login()
}

class LoginTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerWithNameButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    var delegate: loginDelegat?
    var login: LoginResponse?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerButton.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config(userName: String, password: String) {
        emailTextField.text = userName
        passwordTextField.text = password
    }
    
    @IBAction func registerbutton(_ sender: Any) {
        delegate?.register()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        delegate?.login()
    }
    
    @IBAction func registerWithNameBtn(_ sender: Any) {
    }
    
    @IBAction func registerWithGoogleBtn(_ sender: Any) {
    }
    
    @IBAction func registerWithFacebockBtn(_ sender: Any) {
    }
    
}
