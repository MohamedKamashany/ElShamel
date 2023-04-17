//
//  VerificationViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 02/01/2023.
//

import UIKit


protocol VerificationViewProtocol: LoaderView, ErrorView {
    var interactor: VerificationInteractorProtocol? { get set }
    func showHomeScreen()
}


class VerificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,VerificationDelegat {

    @IBOutlet weak var verificationTableView: UITableView!
    
    var interactor: VerificationInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        verificationTableView.delegate = self
        verificationTableView.dataSource = self
        verificationTableView.register(UINib(nibName: "VerificationTableViewCell", bundle: nil), forCellReuseIdentifier: "VerificationTableViewCell")
    }
    
    private func config() {
        let presenter = VerificationPresenter()
        presenter.view = self

        let interactor = VerificationInteractor()
        interactor.presenter = presenter

        self.interactor = interactor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerificationTableViewCell", for: indexPath) as! VerificationTableViewCell
        cell.delegat = self
        cell.config()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 707
    }
    
    func verification(code: String) {
        interactor?.verify(code: code)
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        let destnation = storybord.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//        present(destnation, animated: true, completion: nil)
    }
}


extension VerificationViewController: VerificationViewProtocol {
    
    func showHomeScreen() {
        DispatchQueue.main.async {
            let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self.present(view, animated: true)
        }
    }
    
    func showError(with message: String) {
        
    }
    
    func hideErrorView() {}
    
    
}
