//
//  LoginViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 28/12/2022.
//

import UIKit

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, loginDelegat {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var loginTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTableView.delegate = self
        loginTableView.dataSource = self
        loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: "LoginTableViewCell")
        loginTableView.rowHeight = UITableView.automaticDimension
        self.navigationController?.navigationBar.backgroundColor = AppColors.navigationBarPrimaryColor
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell", for: indexPath) as! LoginTableViewCell
        cell.delegate = self
        return cell
    }

    func register() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            present(vc, animated: false, completion: nil)
    }
}
