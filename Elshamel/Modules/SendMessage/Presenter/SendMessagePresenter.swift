//
//  SendMessagePresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/04/2023.
//

import Foundation



protocol SendMessagePresenterProtocol {
    var view: SendMessageViewProtocol? { get set }
    func presentSuccessMsg(message: String)
    func showError(_ error: NetWorkError)
}

class SendMessagePresenter: SendMessagePresenterProtocol {
    
    var view: SendMessageViewProtocol?
    
    func presentSuccessMsg(message: String) {
        view?.showSuccessMsg(message: message)
    }
    
    func showError(_ error: NetWorkError) {
        view?.showError(with: error.errorType?.getMessage() ?? "")
    }
}
