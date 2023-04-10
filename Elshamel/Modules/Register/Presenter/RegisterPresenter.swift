//
//  RegisterPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/04/2023.
//

import Foundation



protocol RegisterPresenterProtocol {
    var view: RegisterViewProtocol? { get set }
    func presentVerificationView()
//    func presentLoader()
//    func hideLoader()
//    func showError(_ error: NetWorkError)
}

class RegisterPresenter: RegisterPresenterProtocol {
    
    var view: RegisterViewProtocol?
    
    
    func presentVerificationView() {
        view?.showVerificationView()
    }
  
    func hideLoader() {
        
    }
    
    func showError(_ error: NetWorkError) {
        
    }
    
}
