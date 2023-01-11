//
//  ViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit

// splah screen
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Wait 2 seconds and go to the next screen
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.performSegue(withIdentifier: "OpenMenu", sender: nil)
        }
    }


}

