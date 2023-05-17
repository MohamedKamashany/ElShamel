//
//  SubjectConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 06/05/2023.
//

import Foundation
import UIKit

class SubjectConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Subject", bundle: nil).instantiateViewController(withIdentifier: "SubjectViewController") as? SubjectViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
        let presenter = SubjectPresenter()
        let interactor = SubjectInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        return view
    }
}
