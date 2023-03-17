//
//  SplashViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit

protocol LoaderView {
    func hideLoading()
    func showLoading()
}

protocol SplashViewProtocol: AnyObject, LoaderView {
    var interactor: SplashIneractorProtocol? { get set }
    func showErrorView(_ error:String)
    func hideErrorView()
}

// splah screen
class SplashViewController: UIViewController {

    var interactor: SplashIneractorProtocol?
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
//        // Wait 2 seconds and go to the next screen
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            self.performSegue(withIdentifier: "OpenMenu", sender: nil)
//        }
        interactor?.getSplashData()
    }
    
    private func config() {
        let presenter = SplashPresenter()
        presenter.view = self
        
        let interactor = SplashIneractor()
        interactor.presenter = presenter
        
        self.interactor = interactor
    }


}

extension SplashViewController: SplashViewProtocol {
     
    func hideLoading() {
        activityIndicator.stopAnimating()
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func showErrorView(_ error: String) {
        errorLabel.isHidden = false
        errorLabel.text = error
    }
    
    func hideErrorView() {
        errorLabel.isHidden = true
    }
    
    
}

