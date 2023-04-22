//
//  StartExamInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation

//
//protocol StartExamProtocol {
//    var presenter: QuestionsBankPresenterProtocol? { get set }
//    func getQuestions(exam_id: Int)
//}
//
//
//class StartExamInteractor: QuestionsBankInteractorProtocol {
//
//    var presenter: QuestionsBankPresenterProtocol?
//
//    func getQuestions(exam_id: Int) {
//        let v4apiKey = "287|nJnTi0XwJcgwdAnteWLqtG3akTQicqV0Q07QSJKh"
//        let headers = ["Authorization": "Bearer \(v4apiKey)"]
//        let parameters = ["exam_id": "\(exam_id)"]
//        if NetworkManager.shared.isInternetAvailable() {
//            presenter?.view?.startLoading()
//            NetworkManager.shared.processReq(url: .examsStart,
//                                             method: .post,
//                                             bodyParams: parameters,
//                                             returnType: QuestionBankResponse.self, headers: headers) { [weak self] result in
//                self?.presenter?.view?.stopLoading()
//                switch result {
//                case .success(let response):
//                    if let data = response {
//                        DispatchQueue.main.async {
//                            self?.presenter?.presentSuccessMsg(message: data.message  ?? "")
//                        }
//                    }else if let errors = response?.errors {
//                        if let errorMessage = errors.values.first?.first {
//                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.backendError(errorMessage)))
//                        }else{
//                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
//                        }
//                    }else {
//                        self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
//                    }
//
//                case .failure(let error):
//                    DispatchQueue.main.async {
//                        self?.presenter?.showError(error)
//                    }
//                    print(error.errorType?.getMessage() ?? "")
//                }
//            }
//        }else{
//            let error = NetWorkError(errorType: .noInternet)
//            presenter?.showError(error)
//        }
//
//    }
//
//}
