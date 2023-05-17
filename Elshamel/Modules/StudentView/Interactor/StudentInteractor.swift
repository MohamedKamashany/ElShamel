//
//  StudentInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 03/05/2023.
//

import Foundation


protocol StudentInteractorProtocol {
    var presenter: StudentPresenterProtocol? { get set }
    func getMaterial(title: String, body: String)
}

class StudentInteractor: StudentInteractorProtocol {
    
    var presenter: StudentPresenterProtocol?
    
    func getMaterial(title: String,
                     body: String) {
        guard let v4apiKey = LogedInUser.shared.token else { return }
        let headers = ["Authorization": "Bearer \(v4apiKey)"]
        let parameters = ["material_id": "",
                          "grade_id": "",
                          "semester": ""]
        if NetworkManager.shared.isInternetAvailable() {
            presenter?.view?.startLoading()
            NetworkManager.shared.processReq(url: .getMaterials,
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
