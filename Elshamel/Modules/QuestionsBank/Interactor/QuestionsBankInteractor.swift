//
//  QuestionsBankInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation

protocol QuestionsBankInteractorProtocol {
    var presenter: QuestionsBankPresenterProtocol? { get set }
    func getQuestions(exam_id: Int)
}


class QuestionsBankInteractor: QuestionsBankInteractorProtocol {

    var presenter: QuestionsBankPresenterProtocol?

    func getQuestions(exam_id: Int) {
        let v4apiKey = "288|wb0QpB8U9l4AJdGxa7eTGkKXQgcZv4V4MmEG1dWr"
        let headers = ["Authorization": "Bearer \(v4apiKey)"]
        if NetworkManager.shared.isInternetAvailable() {
            presenter?.view?.startLoading()
            NetworkManager.shared.processReq(url: .getExams,
                                             method: .get,
                                             returnType: QuestionBankResponse.self, headers: headers) { [weak self] result in
                self?.presenter?.view?.stopLoading()
                switch result {
                case .success(let response):
                    if let data = response {
                        DispatchQueue.main.async {
                            self?.presenter?.presentSuccessMsg(message: data.message  ?? "")
                        }
                    }else if let errors = response?.errors {
                        if let errorMessage = errors.values.first?.first {
                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.backendError(errorMessage)))
                        }else{
                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                        }
                    }else {
                        self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                    }

                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.presenter?.showError(error)
                    }
                    print(error.errorType?.getMessage() ?? "")
                }
            }
        }else{
            let error = NetWorkError(errorType: .noInternet)
            presenter?.showError(error)
        }

    }

}
