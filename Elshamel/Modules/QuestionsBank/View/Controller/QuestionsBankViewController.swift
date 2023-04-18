//
//  QuestionsBankViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 12/01/2023.
//

import UIKit

class QuestionsBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var questionsLbl: UILabel!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    
//    var questions: [Question] = [
//        Question(name: "", answers: <#T##[Answer]?#>)
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtns()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.register(UINib(nibName: "QuestionsBankTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionsBankTableViewCell")
        TableView.rowHeight = UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsBankTableViewCell", for: indexPath) as! QuestionsBankTableViewCell
        //cell.config()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }
    
    func setBtns() {
        nextButton.layer.cornerRadius = 20
        nextButton.layer.borderColor = AppColors.borderColor.cgColor
        nextButton.layer.borderWidth = 1
        nextButton.layer.shadowColor = AppColors.borderColor.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        nextButton.layer.shadowOpacity = 0.4
        
        previousButton.layer.cornerRadius = 20
        previousButton.layer.borderWidth = 1
        previousButton.layer.borderColor = AppColors.borderColor.cgColor
        previousButton.layer.shadowColor = AppColors.borderColor.cgColor
        previousButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        previousButton.layer.shadowOpacity = 0.4
    }
    
    @IBAction func nextBtn(_ sender: Any) {
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
