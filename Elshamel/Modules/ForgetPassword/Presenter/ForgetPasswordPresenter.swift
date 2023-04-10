//
//  ForgetPasswordPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/04/2023.
//

import Foundation

protocol ForgetPasswordPresenterProtocol {
    var view: ForgetPasswordViewProtocol? { get set }
    func presentSuccessMessage(successMsg: String)
}


class ForgetPasswordPresenter: ForgetPasswordPresenterProtocol {
    
    var view: ForgetPasswordViewProtocol?
    
    func presentSuccessMessage(successMsg: String) {
        view?.showSuccessMessage(with: successMsg)
    }
    
    
}
