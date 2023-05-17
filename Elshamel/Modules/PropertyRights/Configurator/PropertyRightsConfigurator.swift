//
//  PropertyRightsConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 22/04/2023.
//

import Foundation
import UIKit

class PropertyRightsConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "PropertyRights", bundle: nil).instantiateViewController(withIdentifier: "PropertyRightsViewController") as? PropertyRightsViewController else {
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
