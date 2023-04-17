//
//  LoginInteractor.swift
//  Elshamel
//
//  Created by Mohamed Ibrahim on 04/04/2023.
//

import Foundation
import Alamofire

protocol LoginInteractorProtocol {
    var presenter: LoginPresenterProtocol? { get set }
    func getUserWith(email: String?, password: String?)
}

class LoginInteractor: LoginInteractorProtocol {
    
    var presenter: LoginPresenterProtocol?
    
    func getUserWith(email: String?, password: String?) {
        //TODO: validation before the integration
        guard let userMail = email, !userMail.isEmpty else {
            //self?.presenter?.showError(error)
            return
        }
        
        guard let userPassword = password, !userPassword.isEmpty else {
            //self?.presenter?.showError(error)
            return
        }
        
        guard userPassword.count >= 6 else {
            //self?.presenter?.showError(error)
            return
        }
        
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters: [String: String] = ["email": userMail,
                                            "password": userPassword,
                                            "device_id": "device token"
                                         ]
        if NetworkManager.shared.isInternetAvailable() {
            presenter?.view?.startLoading()
            NetworkManager.shared.processReq(url: .login,
                                             method: .post,
                                             bodyParams: parameters,
                                             returnType: LoginResponse.self,
                                             headers: headers,
                                             completionHandler: { [weak self] result in
                self?.presenter?.view?.stopLoading()
                switch result {
                case .success(let response):
                    if let data = response?.data {
                        LogedInUser.shared.token = data.token
                        LogedInUser.shared.userData  = data.account
                        if data.account.isVerified  {
                            self?.presenter?.presentHomeScreen()
                        }else{
                            //TODO: redirect to verification screen.
                        }
                        
                    }else{
                        let error = NetWorkError(errorType: ElShamelErrorType.serverError)
                        self?.presenter?.showError(error)
                    }
                case .failure(let error):
                    self?.presenter?.showError(error)
                }
            })
        }else{
            let error = NetWorkError(errorType: .noInternet)
            presenter?.showError(error)
        }
    }
}
