//
//  ForgetPasswordInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 09/04/2023.
//

import Foundation
import Alamofire


protocol ForgetPasswordInteractorProtocol {
    var presenter: ForgetPasswordPresenterProtocol? { get set }
    func getCode()
}

class ForgetPasswordInteractor: ForgetPasswordInteractorProtocol {
    
    var presenter: ForgetPasswordPresenterProtocol?
    
    func getCode() {
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters: [String: Any] = ["email": "teacher10@gmail.com"]
        AF.request("https://elshamel.site/api/auth/reset-password-code", method: .post, parameters: parameters, headers: HTTPHeaders(headers)).response { [weak self] result in
            switch result.result {
            case .success(let data):
                if let data = data,
                    let code = try? JSONDecoder().decode(ForgetPasswordResponse.self, from: data) {
                    self?.presenter?.presentSuccessMessage(successMsg: code.message ?? "")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
