//
//  StudentsViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 04/01/2023.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var studentLbl: UILabel!
    @IBOutlet weak var addStudentBtn: UIButton!
    @IBOutlet weak var StudentTableView: UITableView!
    @IBOutlet weak var studentNumberLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StudentTableView.delegate = self
        StudentTableView.dataSource = self
        StudentTableView.register(UINib(nibName: "StudentTableViewCell", bundle: nil), forCellReuseIdentifier: "StudentTableViewCell")
        StudentTableView.rowHeight = UITableView.automaticDimension
        backButton.tintColor = AppColors.textColor
        addStudentBtn.titleLabel?.textColor = AppColors.textColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
        cell.config()
        return cell
    }
    
    @IBAction func addStudentBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
}
