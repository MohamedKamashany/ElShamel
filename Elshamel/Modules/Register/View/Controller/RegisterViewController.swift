//
//  RegisterViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 29/12/2022.
//

import UIKit

protocol RegisterViewProtocol {
    var interactor: RegisterInteractorProtocol? { get set }
    func showVerificationView()
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
    
    func register(name: String, email: String, password: String, confirmPass: String, phone: String, educationalLevel: String) {
        interactor?.register()
    }
    
    
    func backToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func register() {
//        interactor?.register()
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        let destination = storybord.instantiateViewController(withIdentifier: "VerificationViewController") as! VerificationViewController
//        navigationController?.pushViewController(destination, animated: true)
//        present(destination, animated: true, completion: nil)
    }
    
}

extension RegisterViewController: RegisterViewProtocol {
     
    func showVerificationView() {
        let teacherView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VerificationViewController") as! VerificationViewController
        present(teacherView, animated: true, completion: nil)
    }
}
