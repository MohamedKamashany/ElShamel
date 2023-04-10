//
//  SplashPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/03/2023.
//

import Foundation

protocol SplashPresenterProtocol {
    var view: SplashViewProtocol? { get set }
    func presentLoader()
    func hideLoader()
    func showError(_ error: NetWorkError)
    func presentHomeScreen()
    func presentLoginScreen()
}

class SplashPresenter: SplashPresenterProtocol {
    
    var view: SplashViewProtocol?
    
    func presentLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.view?.startLoading()
            self?.view?.hideErrorView()
        }
        
    }
    
    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.view?.stopLoading()
        }
    }
    
    func showError(_ error: NetWorkError) {
        let errorMessage = error.errorType?.getMessage() ?? ""
        DispatchQueue.main.async { [weak self] in
            self?.view?.showError(with: errorMessage)
        }
    }
    
    func presentHomeScreen() {
        DispatchQueue.main.async { [weak self] in
            self?.view?.openHomeScreen()
        }
        
    }
    func presentLoginScreen() {
        DispatchQueue.main.async { [weak self] in
            self?.view?.openLoginScreen()
        }
    }
}
