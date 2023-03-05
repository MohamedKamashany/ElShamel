//
//  ExamResultViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/01/2023.
//

import UIKit

class ExamResultViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var examImageaview: UIImageView!
    @IBOutlet weak var examLbl: UILabel!
    @IBOutlet weak var chapterLbl: UILabel!
    @IBOutlet weak var studentNumberLbl: UILabel!
    @IBOutlet weak var addStudentButton: UIButton!
    @IBOutlet weak var examTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentNumberLbl.attributedText = getTitle()
        examTableView.delegate = self
        examTableView.dataSource = self
        examTableView.register(UINib(nibName: "ExamResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ExamResultTableViewCell")
        //    examTableView.rowHeight = UITableView.automaticDimension
        addStudentButton.tintColor = AppColors.textColor
        backButton.tintColor = AppColors.textColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExamResultTableViewCell", for: indexPath) as! ExamResultTableViewCell
        cell.config()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func backBtn(_ sender: Any) {
       dismiss(animated: true)
    }
    
    @IBAction func addBtn(_ sender: Any) {
    }
    
    func getTitle() -> NSMutableAttributedString {
        let result = NSMutableAttributedString()
        let firstAttributedStr = NSAttributedString("عدد الطلاب")
        result.append(firstAttributedStr)
        
        let myAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        let secondAttributedStr = NSAttributedString(string: " 44 ", attributes: myAttribute)
        result.append(secondAttributedStr)
        
        let thirdAttributedStr = NSAttributedString("طالب")
        result.append(thirdAttributedStr)
        return result
    }
    
}
