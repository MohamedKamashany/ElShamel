//
//  StudentPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 03/05/2023.
//

import Foundation

protocol StudentPresenterProtocol {
    var view: StudentViewProtocol? { get set }
    func presentSuccessMsg(message: String)
    func showError(_ error: NetWorkError)
}

class StudentPresenter: StudentPresenterProtocol {
    
    var view: StudentViewProtocol?
    
    func presentSuccessMsg(message: String) {
        view?.showSuccessMsg(message: message)
    }
    
    func showError(_ error: NetWorkError) {
        view?.showError(with: error.errorType?.getMessage() ?? "")
    }
}
