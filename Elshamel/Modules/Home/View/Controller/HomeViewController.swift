//
//  HomeViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 19/01/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var sideMenu: MainViewController? {
        revealViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sideMenuBtn(_ sender: Any) {
        sideMenu?.revealSideMenu()
    }
}


