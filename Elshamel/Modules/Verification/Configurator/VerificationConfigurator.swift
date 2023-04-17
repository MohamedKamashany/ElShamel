//
//  VerificationConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 17/04/2023.
//

import Foundation
import UIKit

class VerificationConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Verifaication", bundle: nil).instantiateViewController(withIdentifier: "VerificationViewController") as? VerificationViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
        let presenter = VerificationPresenter()
        let interactor = VerificationInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        return view
    }
}
