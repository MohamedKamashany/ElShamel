//
//  StudentConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 03/05/2023.
//

import Foundation
import UIKit

class StudentConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Student", bundle: nil).instantiateViewController(withIdentifier: "StudentViewController") as? StudentViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
        let presenter = StudentPresenter()
        let interactor = StudentInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        return view
    }
}
