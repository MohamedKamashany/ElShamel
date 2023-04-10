//
//  SplashInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/03/2023.
//

import Foundation
import Reachability

protocol SplashIneractorProtocol {
    var presenter: SplashPresenterProtocol? { get set }
    func getSplashData()
}

class SplashIneractor: SplashIneractorProtocol {
    
    var presenter: SplashPresenterProtocol?
    
    func getSplashData() {
        // hello world comment
        if NetworkManager.shared.isInternetAvailable() {
            presenter?.presentLoader()
            NetworkManager.shared.processReq(url: .getSplashData, method: .get, returnType: SplashModel.self, completionHandler: { [weak self] result in
                self?.presenter?.hideLoader()
                switch result {
                case .success(let response):
                    if let data = response?.data {
                        //TODO: check about cached user. If there is cached user then will redirect to the home else will redirect to login
                        self?.presenter?.presentLoginScreen()
                    }else{
                        let error = NetWorkError(errorType: ElShamelErrorType.serverError)
                        self?.presenter?.showError(error)
                    }
                case .failure(let error):
                    self?.presenter?.showError(error)
                }
            })
        }else{
            let error = NetWorkError(errorType: .noInternet)
            presenter?.showError(error)
        }
    }
    
    
}
