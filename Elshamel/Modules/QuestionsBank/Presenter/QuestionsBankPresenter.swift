//
//  QuestionsBankPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation



protocol QuestionsBankPresenterProtocol {
    var view: QuestionsBankViewProtocol? { get set }
    func presentSuccessMsg(message: String)
    func showError(_ error: NetWorkError)
}

class QuestionsBankPresenter: QuestionsBankPresenterProtocol {
    
    var view: QuestionsBankViewProtocol?
    
    func presentSuccessMsg(message: String) {
        view?.showSuccessMsg(message: message)
    }
    
    func showError(_ error: NetWorkError) {
        view?.showError(with: error.errorType?.getMessage() ?? "")
    }
}

