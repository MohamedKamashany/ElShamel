//
//  SendMessageConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/04/2023.
//

import Foundation
import UIKit

class SendMessageConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "SendMessage", bundle: nil).instantiateViewController(withIdentifier: "SendMessageViewController") as? SendMessageViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
        let presenter = SendMessagePresenter()
        let interactor = SendMessageInteractor()
        presenter.view = view
        interactor.presenter = presenter
        view.interactor = interactor
        return view
    }
}
