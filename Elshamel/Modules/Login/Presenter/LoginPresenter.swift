//
//  LoginPresenter.swift
//  Elshamel
//
//  Created by Mahmoud ELDemery on 26/02/2023.
//

import Foundation

protocol LoginPresenterProtocol {
    var view: LoginViewProtocol? { get set }
    func presentHomeScreen()
    func showError(_ error: NetWorkError)
}

class LoginPresenter: LoginPresenterProtocol {
    
    var view: LoginViewProtocol?
    
    func presentHomeScreen() {
        view?.openHomeScreen()
    }
    
    func showError(_ error: NetWorkError) {
        let message = error.errorType?.getMessage() ?? Messages.genericErrorMessage
        view?.showError(with: message)
    }
}
