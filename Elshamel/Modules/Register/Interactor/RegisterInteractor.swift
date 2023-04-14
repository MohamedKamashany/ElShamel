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

    func register() {
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters = ["name": "mohamed",
                          "email": "teacher201@gmail.com",
                          "phone": "01097495853",
                          "gender": "Male",
                          "material_id": "1",
                          "device_id": "device_token",
                          "login_method": "apple",
                          "fcm_token": "ahjdkjashdkjasd"]
        NetworkManager.shared.processReq(url: .register,
                                         method: .post,
                                         bodyParams: parameters,
                                         returnType: RegisterResponse.self,
                                         headers: headers) { [weak self] response in
            switch response {
            case.success(let data):
                if let data = data {
                    DispatchQueue.main.async {
//                        self?.presenter?.presentVerificationView()
                        print(data.message ?? "")
                    }
                }else {
                    print("Error can't login")
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
