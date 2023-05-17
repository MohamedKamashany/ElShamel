//
//  SubscriptionViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/04/2023.
//

import UIKit

protocol SubscriptionViewProtocol: LoaderView {
    var interactor: SubscriptionInteractorProtocol? { get set }
    func showSuccessMsg(msg: String)
    func plansView(palns: [PlansData])
}


class SubscriptionViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subscriptionLbl: UILabel!
    @IBOutlet weak var subscriptionTableView: UITableView!
    
    var interactor: SubscriptionInteractorProtocol?
    var plans = [PlansData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setUpTableView()
        self.interactor?.getSubscriptionData()
    }
    
    private func config() {
        let presenter = SubscriptionPresenter()
        presenter.view = self
        
        let interactor = SubscriptionInteractor()
        interactor.presenter = presenter
        
        self.interactor = interactor
    }
    
    func setUpTableView() {
        subscriptionTableView.delegate = self
        subscriptionTableView.dataSource = self
        subscriptionTableView.register(UINib(nibName: "SubscriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "SubscriptionTableViewCell")
        subscriptionTableView.rowHeight = UITableView.automaticDimension
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}


extension SubscriptionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubscriptionTableViewCell") as! SubscriptionTableViewCell
        if indexPath.row == 1 {
            cell.subscripImageView.image = UIImage(named: "year_sup")
        }else if indexPath.row == 2 {
            cell.subscripImageView.image = UIImage(named: "low_sup")
        }else if indexPath.row == 3 {
            cell.subscripImageView.image = UIImage(named: "si_sup")
        }else if indexPath.row == 4 {
            cell.subscripImageView.image = UIImage(named: "math _sup")
        }
        cell.delegate = self
        cell.configure(plans: plans[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension SubscriptionViewController: SubscriptionViewProtocol {
    
    func showSuccessMsg(msg: String) {
        let successMsg = UIAlertController(title: "Success", message: msg , preferredStyle: .alert)
        successMsg.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(successMsg, animated: true)
    }
    
    func plansView(palns: [PlansData]) {
        DispatchQueue.main.async {
            self.plans = palns
            self.subscriptionTableView.reloadData()
        }
    }
}


extension SubscriptionViewController: SubscriptionTableViewCellDelegate {
    
    func subscrip() {
        let phoneNumber =  "01097495951" // you need to change this number
        let appURL = URL(string: "https://wa.me/\(phoneNumber)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL)
            }
        }
    }
}
