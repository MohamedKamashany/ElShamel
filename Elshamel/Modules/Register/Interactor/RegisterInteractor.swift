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
    func register(name: String, email: String, password: String, confirmPass: String, phone: String, educationalLevel: String, gender: String)
}



class RegisterInteractor: RegisterInteractorProtocol {
    
    var presenter: RegisterPresenterProtocol?

    func register(name: String,
                  email: String,
                  password: String,
                  confirmPass: String,
                  phone: String,
                  educationalLevel: String,
                  gender: String) {
        guard !name.isEmpty else {
            print("empty name")
            return
        }
        
        guard !email.isEmpty, email.isValidEmail else {
            print("empty email")
            return
        }
        
        guard !password.isEmpty, password.count >= 6 else {
            print("empty password")
            return
        }
        
        guard confirmPass == password else {
            print("password not confirm")
            return
        }
        
        guard !phone.isEmpty else {
            print("empty phone")
            return
        }
        
        guard !educationalLevel.isEmpty else {
            print("educantion is empty")
            return
        }
        
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters = ["name": name,
                          "email": email,
                          "phone": phone,
                          "gender": gender,
                          "password": password,
                          "password_confirmation": confirmPass,
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
                        self?.presenter?.presentVerificationView()
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


extension String {
    var isValidUsername :Bool {
        return self.count > 3
    }
    var isValidEmail : Bool {
        let format = "^[_A-Za-z0-9-\\+]+(\\.[A-Za-z0-9-]=)*@"
        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self)
    }
    var isValidMobile : Bool {
        let format = "^(009665|9665|\\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7}$)"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self)
    }
    var isValidPassword : Bool {
        return self.count > 5
    }
}
