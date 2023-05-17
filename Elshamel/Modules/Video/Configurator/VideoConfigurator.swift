//
//  VideoConfigurator.swift
//  Elshamel
//
//  Created by mohamed rafik on 08/05/2023.
//

import Foundation
import UIKit

class VideoConfigurator: ParentRouter {
    
    override func createModule() -> UIViewController? {
        guard let view = UIStoryboard(name: "Video", bundle: nil).instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController else {
            return nil
        }
        view.modalPresentationStyle = .fullScreen
//        let presenter = SubjectPresenter()
//        let interactor = SubjectInteractor()
//        presenter.view = view
//        interactor.presenter = presenter
//        view.interactor = interactor
        return view
    }
}
