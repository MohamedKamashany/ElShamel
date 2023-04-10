//
//  SubscriptionInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/04/2023.
//

import Foundation

protocol SubscriptionInteractorProtocol {
    var presenter: SubscriptionPresenterProtocol? { get set }
    func getSubscriptionData()
}



class SubscriptionInteractor: SubscriptionInteractorProtocol {
    
    var presenter: SubscriptionPresenterProtocol?
    
    func getSubscriptionData() {
        
    }
}
