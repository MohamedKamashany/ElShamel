//
//  LoginConfigurator.swift
//  Elshamel
//
//  Created by Mohamed Ibrahim on 04/04/2023.
//

import Foundation
import UIKit

class LoginConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return nil
        }
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.isNavigationBarHidden = true
        navigationController.modalPresentationStyle = .fullScreen
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        
        return navigationController
    }
}
