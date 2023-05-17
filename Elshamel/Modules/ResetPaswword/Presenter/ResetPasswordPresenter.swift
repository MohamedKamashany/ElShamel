//
//  ResetPasswordPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 01/05/2023.
//

import Foundation

protocol ResetPasswordPresenterProtocol {
    var view: ResetPasswordViewProtocol? { get set }
    func presentSuccessMessage(successMsg: String)
}


class ResetPasswordPresenter: ResetPasswordPresenterProtocol {
    
    var view: ResetPasswordViewProtocol?
    
    func presentSuccessMessage(successMsg: String) {
        view?.showSuccessMessage(with: successMsg)
    }
    
    
}
