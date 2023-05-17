//
//  PdfConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 10/05/2023.
//

import Foundation
import UIKit

class PdfConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Pdf", bundle: nil).instantiateViewController(withIdentifier: "PdfViewController") as? PdfViewController else {
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
