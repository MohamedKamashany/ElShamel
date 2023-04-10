//
//  LoadingProtocol.swift
//  Elshamel
//
//  Created by Mohamed Ibrahim on 04/04/2023.
//

import Foundation
import MBProgressHUD


protocol LoaderView {
    func stopLoading()
    func startLoading()
}

extension LoaderView where Self:UIViewController {
    
    func startLoading() {
        DispatchQueue.main.async {
            let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
            indicator.label.text = Messages.loadingMessage
            indicator.show(animated: true)
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

