//
//  ResetPasswordConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 01/05/2023.
//

import Foundation
import UIKit

class ResetPasswordConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "ResetPassword", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController") as? ResetPasswordViewController else {
            return nil
        }
//        let navigationController = UINavigationController(rootViewController: view)
//        navigationController.isNavigationBarHidden = true
//        navigationController.modalPresentationStyle = .fullScreen
        let presenter = ResetPasswordPresenter()
        let interactor = ResetPasswordInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        
        return view
    }
}
