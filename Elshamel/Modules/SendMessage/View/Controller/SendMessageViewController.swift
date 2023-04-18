//
//  SendMessageViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/01/2023.
//

import UIKit
import PlaceholderTextView


protocol SendMessageViewProtocol: LoaderView, ErrorView {
    var interactor: SendMessageInteractorProtocol? { get set }
    func showSuccessMsg(message: String)
}

class SendMessageViewController: UIViewController {
    
    @IBOutlet weak var backGroundImd: UIImageView!
    @IBOutlet weak var messagIcon: UIImageView!
    @IBOutlet weak var sendMessageLbl: UILabel!
    @IBOutlet weak var messageTitleTXt: UITextField!
    @IBOutlet weak var messageContentTxt: PlaceholderTextView!
    @IBOutlet weak var sendButton: UIButton!
    
    var interactor: SendMessageInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtn()
        layoutTxt()
        placeholderTxt()
    }
    
    func layoutTxt() {
        messageTitleTXt.layer.cornerRadius = 10
        messageContentTxt.layer.cornerRadius = 10
    }
    
    func setBtn() {
        sendButton.layer.cornerRadius = 20
        sendButton.layer.borderColor = AppColors.borderColor.cgColor
        sendButton.layer.borderWidth = 1
        sendButton.layer.shadowColor = AppColors.borderColor.cgColor
        sendButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        sendButton.layer.shadowOpacity = 0.4
    }
    
    func placeholderTxt() {
        let frame = CGRect(x: 0.0, y: 64.0, width: view.bounds.width, height: 300.0)
        messageContentTxt.frame = frame
        messageContentTxt.placeholder = "نص الرسالة "
        messageContentTxt.placeholderColor = UIColor.lightGray
        self.view.addSubview(messageContentTxt)
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        guard let title = messageTitleTXt.text, !title.isEmpty else {
            let alert = UIAlertController(title: "خطأ", message: "برجاء ادخال عنوان الرساله", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: nil))
            present(alert, animated: true)
            return }
        guard let body = messageContentTxt.text, !body.isEmpty else {
            let alert = UIAlertController(title: "خطأ", message: "برجاء ادخال نص الرساله", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: nil))
            present(alert, animated: true)
            return }
        interactor?.sendMessage(title: title, body: body)
    }
    
}


extension SendMessageViewController: SendMessageViewProtocol {
    
    func showSuccessMsg(message: String) {
        let successMsg = UIAlertController(title: "", message: message, preferredStyle: .alert)
        successMsg.addAction(UIAlertAction(title: "حسنا", style: .default, handler: {_ in
            self.dismiss(animated: true)
        }))
        present(successMsg, animated: true)
    }
    
    func showError(with message: String) {
        let errorMessage = UIAlertController(title: "خطأ", message: message, preferredStyle: .alert)
        errorMessage.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: nil))
        present(errorMessage, animated: true, completion: nil)
    }
    
    func hideErrorView() {
        
    }
    
}
