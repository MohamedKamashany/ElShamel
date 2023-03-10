//
//  RegisterTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 29/12/2022.
//

import UIKit

protocol RegisterTableViewCellDelegate {
    func backToLogin()
    func register()
//    func setGener(with gender:String)
//    func setPosition(with position:String)
}

class RegisterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newRegisterLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var studentButton: UIButton!
    @IBOutlet weak var teacherButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var educationalLevelTextField: UITextField!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var haveAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
   // var loginBtnClicked: (()->())?
    var delegate:RegisterTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerButton.layer.cornerRadius = 15
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.cornerRadius = 10
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.layer.borderColor = UIColor.white.cgColor
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.cornerRadius = 10
        phoneNumberTextField.layer.borderColor = UIColor.white.cgColor
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.cornerRadius = 10
        educationalLevelTextField.layer.borderColor = UIColor.white.cgColor
        educationalLevelTextField.layer.borderWidth = 1
        educationalLevelTextField.layer.cornerRadius = 10
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func regissterButton(_ sender: Any) {
        delegate?.register()
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        //loginBtnClicked?()
        delegate?.backToLogin()
    }
    
    
    
    @IBAction func teacherBtn(_ sender: Any) {
        teacherButton.setImage(UIImage(named: "mark 1"), for: .normal)
        studentButton.setImage(UIImage(named: "mark"), for: .normal)
    }
    
    @IBAction func studentBtn(_ sender: Any) {
        studentButton.setImage(UIImage(named: "mark 1"), for: .normal)
        teacherButton.setImage(UIImage(named: "mark"), for: .normal)
    }
    
    @IBAction func maleBtn(_ sender: Any) {
        maleButton.setImage(UIImage(named: "mark 1"), for: UIControl.State.normal)
        femaleButton.setImage(UIImage(named: "mark"), for: .normal)
    }
    
    @IBAction func femaleBtn(_ sender: Any) {
        femaleButton.setImage(UIImage(named: "mark 1"), for: .normal)
        maleButton.setImage(UIImage(named: "mark"), for: UIControl.State.normal)
    }
    
    
}
