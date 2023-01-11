//
//  SendMessageViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/01/2023.
//

import UIKit
import PlaceholderTextView

class SendMessageViewController: UIViewController {
    
    @IBOutlet weak var backGroundImd: UIImageView!
    @IBOutlet weak var messagIcon: UIImageView!
    @IBOutlet weak var sendMessageLbl: UILabel!
    @IBOutlet weak var mesasgeTitleTXt: UITextField!
    @IBOutlet weak var messageContentTxt: PlaceholderTextView!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtn()
        layoutTxt()
        placeholderTxt()
    }
    
    func layoutTxt() {
        mesasgeTitleTXt.layer.cornerRadius = 10
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
    }
    
}
