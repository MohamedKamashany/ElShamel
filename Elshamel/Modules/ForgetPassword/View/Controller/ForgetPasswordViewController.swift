//
//  ForgetPasswordViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/04/2023.
//

import UIKit


protocol ForgetPasswordViewProtocol {
    var interactor: ForgetPasswordInteractorProtocol? { get set }
    func showSuccessMessage(with message: String)
}


class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var forgetPasswordLbl: UILabel!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var sendCodeButton: UIButton!
    
    var interactor: ForgetPasswordInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setTxtAndBtn()
        interactor?.getCode()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func config() {
        let presenter = ForgetPasswordPresenter()
        presenter.view = self

        let interactor = ForgetPasswordInteractor()
        interactor.presenter = presenter

        self.interactor = interactor
    }
    
    func setTxtAndBtn() {
        emailTxt.layer.borderColor = UIColor.white.cgColor
        emailTxt.layer.borderWidth = 1
        emailTxt.layer.cornerRadius = 10
        emailTxt.layer.masksToBounds = true
        //Button
        sendCodeButton.layer.cornerRadius = 20
        //        verificationBtn.layer.masksToBounds = false
        sendCodeButton.layer.shadowColor = #colorLiteral(red: 0.008414091542, green: 0.3898709118, blue: 0.6640194058, alpha: 1)
        sendCodeButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        sendCodeButton.layer.shadowOpacity = 0.4
    }
    
    @IBAction func sendCodeBtn(_ sender: Any) {
    }
    
}


extension ForgetPasswordViewController: ForgetPasswordViewProtocol {
    
    func showSuccessMessage(with message: String) {
        let successMessage = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        successMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(successMessage, animated: true, completion: nil)
    }
    
}
