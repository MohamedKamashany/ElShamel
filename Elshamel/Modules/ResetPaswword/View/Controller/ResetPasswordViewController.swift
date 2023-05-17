//
//  ResetPasswordViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 01/05/2023.
//

import UIKit


protocol ResetPasswordViewProtocol {
    var interactor: ResetPasswordInteractorProtocol? { get set }
    func showSuccessMessage(with message: String)
}

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var resetPasswordLbl: UILabel!
    @IBOutlet weak var codeTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var email: String?
    var interactor: ResetPasswordInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTxtAndBtn()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setTxtAndBtn() {
        codeTxt.layer.borderColor = UIColor.white.cgColor
        codeTxt.layer.borderWidth = 1
        codeTxt.layer.cornerRadius = 10
        codeTxt.layer.masksToBounds = true
        
        passwordTxt.layer.borderColor = UIColor.white.cgColor
        passwordTxt.layer.borderWidth = 1
        passwordTxt.layer.cornerRadius = 10
        passwordTxt.layer.masksToBounds = true
        
        confirmPasswordTxt.layer.borderColor = UIColor.white.cgColor
        confirmPasswordTxt.layer.borderWidth = 1
        confirmPasswordTxt.layer.cornerRadius = 10
        confirmPasswordTxt.layer.masksToBounds = true
        //Button
        sendButton.layer.cornerRadius = 20
        sendButton.layer.shadowColor = #colorLiteral(red: 0.008414091542, green: 0.3898709118, blue: 0.6640194058, alpha: 1)
        sendButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        sendButton.layer.shadowOpacity = 0.4
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        guard let email = email else { return }
        guard let code = codeTxt.text else { return }
        guard let password = passwordTxt.text else { return }
        guard let confirmPass = confirmPasswordTxt.text, confirmPass == password else { return }
        interactor?.resetPassword(email: email, code: code, password: password, confirmPass: confirmPass)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension ResetPasswordViewController: ResetPasswordViewProtocol {
    
    func showSuccessMessage(with message: String) {
        let successMessage = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        successMessage.addAction(UIAlertAction(title: "اوك", style: .cancel, handler: nil ))
        present(successMessage, animated: true, completion: nil)
    }
    
}
