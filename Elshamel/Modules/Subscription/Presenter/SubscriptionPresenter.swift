//
//  SubscriptionPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/04/2023.
//

import Foundation

protocol SubscriptionPresenterProtocol {
    var view: SubscriptionViewProtocol? { get set }
}

class SubscriptionPresenter: SubscriptionPresenterProtocol {
    
    var view: SubscriptionViewProtocol?
}
