//
//  ExamsConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 02/05/2023.
//

import Foundation
import UIKit

class ExamsConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Exams", bundle: nil).instantiateViewController(withIdentifier: "ExamsViewController") as? ExamsViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
//        let presenter = QuestionsBankPresenter()
//        let interactor = QuestionsBankInteractor()
//        presenter.view = view
//        interactor.presenter = presenter
//        view.interactor = interactor
        return view
    }
}
