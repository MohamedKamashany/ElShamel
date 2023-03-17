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
}

class SplashPresenter: SplashPresenterProtocol {
    
    var view: SplashViewProtocol?
    
    func presentLoader() {
        view?.showLoading()
        view?.hideErrorView()
    }
    
    func hideLoader() {
        view?.hideLoading()
    }
    
    func showError(_ error: NetWorkError) {
        let errorMessage = error.errorType?.getMessage() ?? ""
        view?.showErrorView(errorMessage)
    }
}
