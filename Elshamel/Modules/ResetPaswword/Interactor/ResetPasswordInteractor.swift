//
//  ResetPasswordInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 01/05/2023.
//

import Foundation


protocol ResetPasswordInteractorProtocol {
    var presenter: ResetPasswordPresenterProtocol? { get set }
    func resetPassword(email: String, code: String, password: String, confirmPass: String)
}

class ResetPasswordInteractor: ResetPasswordInteractorProtocol {
    
    var presenter: ResetPasswordPresenterProtocol?
    
    func resetPassword(email: String,
                       code: String,
                       password: String,
                       confirmPass: String) {
        let parameters = ["email": email,
                          "password_reset_code": code,
                          "password": password,
                          "password_confirmation": confirmPass]
        NetworkManager.shared.processReq(url: .resetPassword,
                                         method: .post,
                                         bodyParams: parameters,
                                         returnType: ResetPasswordResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                if let data = response {
                    DispatchQueue.main.async {
                        self?.presenter?.presentSuccessMessage(successMsg: data.message ?? "")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
