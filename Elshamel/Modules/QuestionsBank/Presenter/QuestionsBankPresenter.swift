//
//  QuestionsBankPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation



protocol QuestionsBankPresenterProtocol {
    var view: QuestionsBankViewProtocol? { get set }
    func presentQuestions(question: [Questions])
    func showError(_ error: NetWorkError)
}

class QuestionsBankPresenter: QuestionsBankPresenterProtocol {
    
    var view: QuestionsBankViewProtocol?
    
    func presentQuestions(question: [Questions]) {
        view?.showQuestions(question: question)
    }
    
    func showError(_ error: NetWorkError) {
        view?.showError(with: error.errorType?.getMessage() ?? "")
    }
}

