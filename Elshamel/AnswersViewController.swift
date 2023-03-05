//
//  AnswersViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit

class AnswersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AnswersTableViewCell", bundle: nil), forCellReuseIdentifier: "AnswersTableViewCell")
    }

}
//------------------------------------------------------------------------------------

extension AnswersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersTableViewCell", for: indexPath) as! AnswersTableViewCell
        cell.setupCollectionview()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}
