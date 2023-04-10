//
//  RegisterInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/04/2023.
//

import Foundation
import Alamofire



protocol RegisterInteractorProtocol {
    var presenter: RegisterPresenterProtocol? { get set }
    func register()
}



class RegisterInteractor: RegisterInteractorProtocol {
    
    var presenter: RegisterPresenterProtocol?

//    func register() {
//        let headers: [String: String] = ["Accept": "application/json"]
//        let parameters: [String: Any] = ["name": "mohamed",
//                                         "email": "prince4moha5@gmail.com",
//                                         "phone": "01097495951",
//                                         "gender": "Male",
//                                         "material_id": "1",
//                                         "device_id": "device token",
//                                         "login_method": "apple",
//                                         "fcm_token": "ahjdkjashdkjasd"]
//        NetworkManager.shared.processReq(url: .register, method: .post, bodyParams: parameters, returnType: RegisterResponse.self, headers: HTTPHeaders(headers)) { [weak self] response in
//            switch response {
//            case.success(let data):
//                if let data = data?.data,
//                   let register = try? JSONDecoder().decode(RegisterResponse.self, from: data) {
//
//                }else {
//                    print("Error can't login")
//                }
//            case.failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func register() {
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters: [String: Any] = ["name": "mohamed",
                                         "email": "prince4moha5@gmail.com",
                                         "phone": "01097495951",
                                         "gender": "Male",
                                         
                                         "grade_id": "1",
//                                         "material_id": "1",
                                         "device_id": "device_token",
//                                         "login_method": "apple",
                                         "login_method": "facebook",
//                                         "fcm_token": "ahjdkjashdkjasd"
                                         "fcm_token": "askdjlaskdklasd"]
        AF.request("https://elshamel.site/api/student/auth/register", method: .post, parameters: parameters, headers: HTTPHeaders(headers)).response { [weak self] response in
            switch response.result {
            case.success(let data):
                if let data = data,
                   let register = try? JSONDecoder().decode(RegisterResponse.self, from: data) {
                    self?.presenter?.presentVerificationView()
                } else {
                    print("Error can't login")
                }
            case.failure(let error):
                print(error)
            }
        }
    }

}
