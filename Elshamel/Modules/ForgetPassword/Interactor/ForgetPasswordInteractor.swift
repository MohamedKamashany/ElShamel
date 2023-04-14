//
//  ForgetPasswordInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/04/2023.
//

import Foundation
import Alamofire


protocol ForgetPasswordInteractorProtocol {
    var presenter: ForgetPasswordPresenterProtocol? { get set }
    func getCode(email: String)
}

class ForgetPasswordInteractor: ForgetPasswordInteractorProtocol {
    
    var presenter: ForgetPasswordPresenterProtocol?
    
    func getCode(email: String) {
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters = ["email": email]
        NetworkManager.shared.processReq(url: .forgetPassword,
                                         method: .post,
                                         bodyParams: parameters,
                                         returnType: ForgetPasswordResponse.self,
                                         headers: headers) { [weak self] result in
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
