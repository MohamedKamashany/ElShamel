//
//  ForgetPasswordConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 01/05/2023.
//

import Foundation
import UIKit

class ForgetPasswordConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "ForgetPassword", bundle: nil).instantiateViewController(withIdentifier: "ForgetPasswordViewController") as? ForgetPasswordViewController else {
            return nil
        }
//        let navigationController = UINavigationController(rootViewController: view)
//        navigationController.isNavigationBarHidden = true
//        navigationController.modalPresentationStyle = .fullScreen
        let presenter = ForgetPasswordPresenter()
        let interactor = ForgetPasswordInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        
        return view
    }
}
