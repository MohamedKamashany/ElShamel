//
//  HomeConfigurator.swift
//  Elshamel
//
//  Created by Mohamed Ibrahim on 14/04/2023.
//

import Foundation
import UIKit

class HomeConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
//        let navigationController = UINavigationController(rootViewController: view)
//        navigationController.isNavigationBarHidden = true
//        navigationController.modalPresentationStyle = .fullScreen
//        let presenter = LoginPresenter()
//        let interactor = LoginInteractor()
//        presenter.view = view
//        interactor.presenter = presenter
//        view.interactor = interactor
        
        return view
    }
}
