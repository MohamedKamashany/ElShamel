//
//  LoginPresenter.swift
//  Elshamel
//
//  Created by Mahmoud ELDemery on 26/02/2023.
//

import Foundation


protocol LoginPresenterProtocol {
    var view: LoginViewProtocol? { get set }
    func presentLoader()
    func hideLoader()
    func showError(_ error: NetWorkError)
}

class LoginPresenter: LoginPresenterProtocol {
    
    var view: LoginViewProtocol?
    
    
    func presentLoader() {
        
    }
  
    func hideLoader() {
        
    }
    
    func showError(_ error: NetWorkError) {
        
    }
    
}
