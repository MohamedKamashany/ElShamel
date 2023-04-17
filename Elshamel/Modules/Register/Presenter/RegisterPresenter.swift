//
//  RegisterPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/04/2023.
//

import Foundation



protocol RegisterPresenterProtocol {
    var view: RegisterViewProtocol? { get set }
    func presentVerificationView(for email:String)
    func showError(_ error: NetWorkError)
}

class RegisterPresenter: RegisterPresenterProtocol {
    
    var view: RegisterViewProtocol?
    
    
    func presentVerificationView(for email:String) {
        view?.showVerificationView(for: email)
    }
    
    func showError(_ error: NetWorkError) {
        if let message = error.errorType?.getMessage() {
            view?.showError(with: message)
        }
    }
    
}
