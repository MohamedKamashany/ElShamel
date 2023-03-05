//
//  RegisterViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 29/12/2022.
//

import UIKit

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RegisterTableViewCellDelegate {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var registerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView.delegate = self
        registerTableView.dataSource = self
        registerTableView.register(UINib(nibName: "RegisterTableViewCell", bundle: nil), forCellReuseIdentifier: "RegisterTableViewCell")
//        registerTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterTableViewCell", for: indexPath) as! RegisterTableViewCell
        cell.delegate = self
//        cell.loginBtnClicked = {
//            self.dismiss(animated: true, completion: nil)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 816
    }
    
    func backToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func register() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let destination = storybord.instantiateViewController(withIdentifier: "VerificationViewController") as! VerificationViewController
//        navigationController?.pushViewController(destination, animated: true)
        present(destination, animated: true, completion: nil)
    }
    
}



