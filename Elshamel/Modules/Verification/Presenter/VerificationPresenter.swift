//
//  VerificationPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/04/2023.
//

import Foundation



protocol VerificationPresenterProtocol {
    var view: VerificationViewProtocol? { get set }
    func presentHomeScreen()
    func showError(_ error: NetWorkError)
}

class VerificationPresenter: VerificationPresenterProtocol {
    
    var view: VerificationViewProtocol?
    
    func presentHomeScreen() {
        view?.showHomeScreen()
    }
    
    func showError(_ error: NetWorkError) {
        if let message = error.errorType?.getMessage() {
            view?.showError(with: message)
        }
    }
    
}
