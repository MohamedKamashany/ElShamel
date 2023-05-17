//
//  SubscriptionInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/04/2023.
//

import Foundation
import UIKit
import Alamofire


protocol SubscriptionInteractorProtocol {
    var presenter: SubscriptionPresenterProtocol? { get set }
    func getSubscriptionData()
}



class SubscriptionInteractor: SubscriptionInteractorProtocol {
    
    var presenter: SubscriptionPresenterProtocol?
    
//    func getSubscriptionData() {
//        let v4apiKey = "222|WZKs8BeubiG0McFonUtMhSfduEU3ueps5wcLMEJR"
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(v4apiKey)"
//        ]
//        NetworkManager.shared.processReq(url: .plans,
//                                         method: .get,
//                                         returnType: SubscriptionResponse.self, headers: headers) { [weak self] result in
//            switch result {
//            case .success(let response):
//                if let data = response {
//                    DispatchQueue.main.async {
//                        self?.presenter?.presentSuccessMsg(msg: data.message  ?? "")
//                    }
//                }
//            case .failure(let error):
//                print(error.errorType?.getMessage() ?? "")
//            }
//        }
//    }
    
    func getSubscriptionData() {
        presenter?.view?.startLoading()
        guard let v4apiKey = LogedInUser.shared.token else { return }
        let headers = ["Authorization": "Bearer \(v4apiKey)"]
        NetworkManager.shared.processReq(url: .plans,
                                         method: .get,
                                         returnType: SubscriptionResponse.self, headers: headers) { [weak self] result in
            self?.presenter?.view?.stopLoading()
            switch result {
            case .success(let response):
                if let data = response {
                    DispatchQueue.main.async {
                        //self?.presenter?.presentSuccessMsg(msg: data.message  ?? "")
                        self?.presenter?.presentPlans(plans: data.data?.plans ?? [])
                    }
                }
            case .failure(let error):
                print(error.errorType?.getMessage() ?? "")
            }
        }
    }

}
