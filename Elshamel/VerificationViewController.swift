//
//  VerificationViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 02/01/2023.
//

import UIKit

class VerificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var verificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verificationTableView.delegate = self
        verificationTableView.dataSource = self
        verificationTableView.register(UINib(nibName: "VerificationTableViewCell", bundle: nil), forCellReuseIdentifier: "VerificationTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerificationTableViewCell", for: indexPath) as! VerificationTableViewCell
        cell.config()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 707
    }
    
}
