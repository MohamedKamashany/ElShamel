//
//  SubscriptionPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/04/2023.
//

import Foundation

protocol SubscriptionPresenterProtocol {
    var view: SubscriptionViewProtocol? { get set }
    func presentSuccessMsg(msg: String)
    func presentPlans(plans: [PlansData])
}

class SubscriptionPresenter: SubscriptionPresenterProtocol {
    
    var view: SubscriptionViewProtocol?
    
    func presentSuccessMsg(msg: String) {
        view?.showSuccessMsg(msg: msg)
    }
    
    func presentPlans(plans: [PlansData]) {
        view?.plansView(palns: plans)
    }
}
