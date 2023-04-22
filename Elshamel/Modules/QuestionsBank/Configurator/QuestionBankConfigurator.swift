//
//  QuestionBankConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/04/2023.
//

import Foundation
import UIKit

class QuestionBankConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "QuestionBank", bundle: nil).instantiateViewController(withIdentifier: "QuestionsBankViewController") as? QuestionsBankViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
        let presenter = QuestionsBankPresenter()
        let interactor = QuestionsBankInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        return view
    }
}
