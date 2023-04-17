//
//  VerificationInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/04/2023.
//

import Foundation
import UIKit


protocol VerificationInteractorProtocol {
    var presenter: VerificationPresenterProtocol? { get set }
    func verify(code: String, email: String?)
}


class VerificationInteractor: VerificationInteractorProtocol {
    
    var presenter: VerificationPresenterProtocol?
    
    func verify(code: String, email: String?) {
        guard let email = email else { return }
        let parameters = ["verification_code": code,
                          "email": email,
                          "device_id": "device_id"
                          ]
        //TODO: if there is internet connection or not.
        presenter?.view?.startLoading()
        NetworkManager.shared.processReq(url: .verify,
                                         method: .post,
                                         bodyParams: parameters,
                                         returnType: VerificationResponse.self) { response in
            self.presenter?.view?.stopLoading()
            switch response {
            case .success(let response):
                if let data = response?.data {
                   DispatchQueue.main.async {
                       self.presenter?.presentHomeScreen()
                       print(response?.message ?? "")
                   }
                }else if let errors = response?.errors {
                    if let errorMessage = errors.values.first?.first {
                        self.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.backendError(errorMessage)))
                    }else{
                        self.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                    }
                }else {
                   self.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
               }
                
            case .failure(let error):
                self.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                print(error)
            }
        }
    }
}
