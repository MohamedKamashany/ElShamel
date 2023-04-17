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
    func verify(code: String)
}


class VerificationInteractor: VerificationInteractorProtocol {
    
    var presenter: VerificationPresenterProtocol?
    
    func verify(code: String) {
        let parameters = ["verification_code": code,
                          "device_id": "device_id",
                          "email": "mohamed.moussa.soli@gmail.com"]
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
