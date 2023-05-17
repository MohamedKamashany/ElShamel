//
//  PdfViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/05/2023.
//

import UIKit
import SDWebImage
import SafariServices

class PdfViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var explanationContainerView: UIView!
    @IBOutlet weak var explanationButton: UIButton!
    @IBOutlet weak var questionBankContainerView: UIView!
    @IBOutlet weak var questionBankButton: UIButton!
    
    var pdfs: [Pdfs]?
    var selectedMaterial: Material?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutContainersViews()
        config()
    }
    
    func layoutContainersViews() {
        explanationContainerView.layer.cornerRadius = 15
        explanationContainerView.layer.shadowColor = UIColor.gray.cgColor
        explanationContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        explanationContainerView.layer.shadowOpacity = 0.4
        
        questionBankContainerView.layer.cornerRadius = 15
        questionBankContainerView.layer.shadowColor = UIColor.gray.cgColor
        questionBankContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        questionBankContainerView.layer.shadowOpacity = 0.4
    }
    
    func config() {
        subjectLbl.text = selectedMaterial?.name
        subjectImageView.sd_setImage(with: URL(string: selectedMaterial?.image ?? ""), placeholderImage: UIImage(named: ""))
    }
    
    @IBAction func explanationBtn(_ sender: Any) {
        if pdfs?.first?.is_free == true {
            guard let pdfFile = pdfs?.first?.file else { return }
            let safariVC = SFSafariViewController(url: (URL(string: pdfFile)!))
            present(safariVC, animated: true)
        }else {
            let view = UIStoryboard(name: "Subscription", bundle: nil).instantiateViewController(withIdentifier: "SubscriptionViewController") as! SubscriptionViewController
            present(view, animated: true, completion: nil)
        }
       
    }
    
    @IBAction func questionBankBtn(_ sender: Any) {
        let view = UIStoryboard(name: "Subscription", bundle: nil).instantiateViewController(withIdentifier: "SubscriptionViewController") as! SubscriptionViewController
        present(view, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
