//
//  LoginViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit
import Alamofire

protocol LoginViewProtocol: AnyObject, LoaderView {
    var interactor: LoginIneractorProtocol? { get set }
    func showErrorView(_ error:String)
    func hideErrorView()
}


class LoginViewController: UIViewController {
    
    var interactor: LoginIneractorProtocol?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var loginTableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
//    let network = NetworkManager<Login>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.navigationController?.navigationBar.backgroundColor = AppColors.navigationBarPrimaryColor
        activityIndicator.isHidden = true
        config()
    }

    func setUpTableView() {
        loginTableView.delegate = self
        loginTableView.dataSource = self
        loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: "LoginTableViewCell")
        loginTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func config() {
        let presenter = LoginPresenter()
        presenter.view = self
        
        let interactor = LoginInteractor()
        interactor.presenter = presenter
        
        self.interactor = interactor
    }

}
//----------------------------------------------------------------------------------------------------
    
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
//----------------------------------------------------------------------------------------------------

extension LoginViewController: loginDelegat {

    func register() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            present(vc, animated: false, completion: nil)
    }
    
    func login() {
        interactor?.getLoginData()
//        network.getServices(serviceName: NetworkUtilities.loginService,
//                            method: HTTPMethod.post,
//                            parameters: ["email": "taha@gmail.com", "password": "12345678"],
//                            headers: ["Accept" : "application/json"]) { result in
//            switch result {
//            case .success(let data):
//                
//                break
//                
//            case .failure(let error):
//                
//                break
//            }
//        }
    }
}
//----------------------------------------------------------------------------------------------------
extension LoginViewController: LoginViewProtocol {
     
    func hideLoading() {
//        activityIndicator.stopAnimating()
    }
    
    func showLoading() {
//        activityIndicator.startAnimating()
    }
    
    func showErrorView(_ error: String) {
//        errorLabel.isHidden = false
//        errorLabel.text = error
    }
    
    func hideErrorView() {
//        errorLabel.isHidden = true
    }
    
    
}

