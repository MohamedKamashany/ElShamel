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
            presenter?.showError(NetWorkError(errorType: ElShamelErrorType.validationError("لا يوجد اسم")))
            return
        }
        
        guard !email.isEmpty else {
            presenter?.showError(NetWorkError(errorType: ElShamelErrorType.validationError("لا يوجد بريد الكتروني")))
            return
        }
        
        guard !password.isEmpty, password.count >= 6 else {
            presenter?.showError(NetWorkError(errorType: ElShamelErrorType.validationError("لا يوجد باسورد")))
            return
        }
        
        guard confirmPass == password else {
            presenter?.showError(NetWorkError(errorType: ElShamelErrorType.validationError("الباسورد وتاكيد الباسورد غير متشابهين")))
            return
        }
        
        //        guard !phone.isEmpty else {
        //            print("empty phone")
        //            return
        //        }
        
        //        guard !educationalLevel.isEmpty else {
        //presenter?.showError(NetWorkError(errorType: ElShamelErrorType.validationError("")))
        //            print("educantion is empty")
        //            return
        //        }
        presenter?.view?.startLoading()
        let headers: [String: String] = ["Accept": "application/json"]
        let parameters = ["name": name,
                          "email": email,
                          "phone": phone,
                          "gender": gender,
                          "password": password,
                          "password_confirmation": confirmPass,
                          "material_id": "1",
                          "device_id": "device_token",
                          "login_method": "",
                          "fcm_token": "ahjdkjashdkjasd"]
        NetworkManager.shared.processReq(url: .register,
                                         method: .post,
                                         bodyParams: parameters,
                                         returnType: RegisterResponse.self,
                                         headers: headers) { [weak self] result in
            
            self?.presenter?.view?.stopLoading()
            switch result {
            case.success(let response):
                 if let data = response?.data {
                    DispatchQueue.main.async {
                        self?.presenter?.presentVerificationView()
                        print(response?.message ?? "")
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
                
                break
            case.failure(let error):
                print(error)
                break
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
