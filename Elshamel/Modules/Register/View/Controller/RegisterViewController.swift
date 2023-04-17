//
//  RegisterViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 29/12/2022.
//

import UIKit

protocol RegisterViewProtocol: LoaderView, ErrorView {
    var interactor: RegisterInteractorProtocol? { get set }
    func showVerificationView(for email:String)
}


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var registerTableView: UITableView!
    
    var interactor: RegisterInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        config()
    }
    
    func setUpTableView() {
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.register(UINib(nibName: "RegisterTableViewCell", bundle: nil), forCellReuseIdentifier: "RegisterTableViewCell")
//        registerTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func config() {
        let presenter = RegisterPresenter()
        presenter.view = self

        let interactor = RegisterInteractor()
        interactor.presenter = presenter

        self.interactor = interactor
    }

}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterTableViewCell", for: indexPath) as! RegisterTableViewCell
        cell.delegate = self
//        cell.loginBtnClicked = {
//            self.dismiss(animated: true, completion: nil)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 816
    }
    
}

extension RegisterViewController: RegisterTableViewCellDelegate {
    
    func register(name: String,
                  email: String,
                  password: String,
                  confirmPass: String,
                  phone: String,
                  educationalLevel: String,
                  gender: String) {
        interactor?.register(name: name,
                             email: email,
                             password: password,
                             confirmPass: confirmPass,
                             phone: phone,
                             educationalLevel: educationalLevel,
                             gender: gender)
    }
    
    
    func backToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension RegisterViewController: RegisterViewProtocol {
     
    func showVerificationView(for email:String) {
        DispatchQueue.main.async {[weak self] in
            guard let view = VerificationConfigurator().createModule() as? VerificationViewController else { return }
            view.email = email
            self?.present(view, animated: true)
        }
    }
    
    func showError(with message: String) {
        DispatchQueue.main.async {[weak self] in
            let alert = UIAlertController(title:"", message: message , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "اوك", style: .cancel, handler: nil))
            self?.present(alert, animated: true)
        }
    }
    
    func hideErrorView() {}
}

