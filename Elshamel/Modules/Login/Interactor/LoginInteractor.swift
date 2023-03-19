//
//  LoginInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/03/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol LoginIneractorProtocol {
    var presenter: LoginPresenterProtocol? { get set }
    func getLoginData()
}



class LoginInteractor: LoginIneractorProtocol {
    
    var presenter: LoginPresenterProtocol?

    func getLoginData() {
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters: [String: Any] = ["email": "prince4moha5@gmail.com",
                                         "device_id": "device token",
                                         "login_method": "facebook"]
        AF.request("https://elshamel.site/api/auth/login", method: .post, parameters: parameters,headers: HTTPHeaders(headers)).response { [weak self] response in
            switch response.result {
            case.success(let data):
                if let data = data,
                   let loginTask = try? JSONDecoder().decode(LoginAcount.self, from: data) {
                    print(loginTask.data?.account?.name ?? "can't login")
                } else {
                    print("Error can't login")
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
}
