//
//  LoginViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit
import Alamofire
import MBProgressHUD

protocol ErrorView {
    func showError(with message: String)
    func hideErrorView()
}


protocol LoginViewProtocol: ErrorView, LoaderView {
    var interactor: LoginInteractorProtocol? { get set }
    func openHomeScreen()
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var loginTableView: UITableView!
    
    var interactor: LoginInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.navigationController?.navigationBar.backgroundColor = AppColors.navigationBarPrimaryColor
    }

    func setUpTableView() {
        loginTableView.delegate = self
        loginTableView.dataSource = self
        loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: "LoginTableViewCell")
        loginTableView.rowHeight = UITableView.automaticDimension
    }

}

    
extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell", for: indexPath) as! LoginTableViewCell
        cell.delegate = self
//        cell.config(userName: "taha@gmail.com", password: "12345678")
        return cell
    }
}


extension LoginViewController: loginDelegate {

    func register() {
        let storybord = UIStoryboard(name: "Register", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            present(vc, animated: false, completion: nil)
    }
    
    func login(email: String?, password: String?) {
        interactor?.getUserWith(email: email, password: password)
    }
    
    func forgetPassword() {
        let forgetPasswordView = UIStoryboard(name: "ForgetPassword", bundle: nil).instantiateViewController(withIdentifier: "ForgetPasswordViewController") as! ForgetPasswordViewController
        present(forgetPasswordView, animated: true, completion: nil)
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func openHomeScreen() {
        DispatchQueue.main.async { [weak self] in
            let storybord = UIStoryboard(name: "Main", bundle: nil)
            let destnation = storybord.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self?.present(destnation, animated: true, completion: nil)
        }
        
//        DispatchQueue.main.async {
//            guard let view = HomeConfigurator().createModule() else { return }
//            self.present(view, animated: true)
//        }
    }
    
    func showError(with message: String) {
        //TODO: show alert with the message
    }
    
    func hideErrorView() {
        
    }
}
