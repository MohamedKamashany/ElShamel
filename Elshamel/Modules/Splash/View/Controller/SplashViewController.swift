//
//  SplashViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit

protocol SplashViewProtocol: AnyObject, LoaderView, ErrorView {
    var interactor: SplashIneractorProtocol? { get set }
    func openHomeScreen()
    func openLoginScreen()
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
    
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func showError(with message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
    func hideErrorView() {
        errorLabel.isHidden = true
    }
    
    func openHomeScreen() {
        DispatchQueue.main.async { [weak self] in
            let storybord = UIStoryboard(name: "Main", bundle: nil)
            let destnation = storybord.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self?.present(destnation, animated: true, completion: nil)
        }
    }
    
    func openLoginScreen() {
        DispatchQueue.main.async {
            guard let view = LoginConfigurator().createModule() else { return }
            self.present(view, animated: true)
        }
        
//        let view = UIStoryboard(name: "Subscription", bundle: nil).instantiateViewController(withIdentifier: "SubscriptionViewController") as! SubscriptionViewController
    }
}

