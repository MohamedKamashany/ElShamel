//
//  SendMessageInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/04/2023.
//

import Foundation


protocol SendMessageInteractorProtocol {
    var presenter: SendMessagePresenterProtocol? { get set }
    func sendMessage(title: String, body: String)
}

class SendMessageInteractor: SendMessageInteractorProtocol {
 
    var presenter: SendMessagePresenterProtocol?
    
    func sendMessage(title: String, body: String) {
        let v4apiKey = "282|UxvoMT68nvLqpFfW1roVcJmadDGfEeHz7Yx6bO4R"
        let headers = ["Authorization": "Bearer \(v4apiKey)"]
        let parameters = ["title": title,
                          "body": body]
        if NetworkManager.shared.isInternetAvailable() {
            presenter?.view?.startLoading()
            NetworkManager.shared.processReq(url: .sendMessage,
                                             method: .post,
                                             bodyParams: parameters,
                                             returnType: SendMessageResponse.self, headers: headers) { [weak self] result in
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
