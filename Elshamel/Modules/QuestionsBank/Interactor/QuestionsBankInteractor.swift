//
//  QuestionsBankInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation

protocol QuestionsBankInteractorProtocol {
    var presenter: QuestionsBankPresenterProtocol? { get set }
    func getExamContent(exam_id: Int)
    func setQuestions(_ questions: [Questions]?)
}


class QuestionsBankInteractor: QuestionsBankInteractorProtocol {

    var presenter: QuestionsBankPresenterProtocol?

    private var questions: [Questions]?
    
    func getExamContent(exam_id: Int) {
        guard let v4apiKey = LogedInUser.shared.token else { return }
        let headers = ["Authorization": "Bearer \(v4apiKey)"]
        if NetworkManager.shared.isInternetAvailable() {
            presenter?.view?.startLoading()
            NetworkManager.shared.processReq(url: .getExamContent,
                                             method: .get,
                                             addedExtra: "\(exam_id)",
                                             returnType: QuestionBankResponse.self, headers: headers) { [weak self] result in
                self?.presenter?.view?.stopLoading()
                switch result {
                case .success(let response):
                    if let data = response {
                        DispatchQueue.main.async {
                            self?.presenter?.presentQuestions(question: data.data?.questions ?? [])
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
    
    func setQuestions(_ questions: [Questions]?) {
        self.questions = questions
    }

}
