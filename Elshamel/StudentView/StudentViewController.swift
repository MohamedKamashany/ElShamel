//
//  StudentViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 24/01/2023.
//

import UIKit

class StudentViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var studentNameLbl: UILabel!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var studentTableView: UITableView!
    @IBOutlet weak var notificationButton: UIButton!
    
    var sideMenu: MainViewController? {
        revealViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableView.register(UINib(nibName: "SubjectsTableViewCell", bundle: nil), forCellReuseIdentifier: "SubjectsTableViewCell")
        studentTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
        studentTableView.register(UINib(nibName: "FollowTableViewCell", bundle: nil), forCellReuseIdentifier: "FollowTableViewCell")
//        studentTableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func sideMenuBtn(_ sender: Any) {
        sideMenu?.revealSideMenu()
    }
    
    @IBAction func notificationBtn(_ sender: Any) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let notification = storybord.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        present(notification, animated: true, completion: nil)
    }
}
//--------------------------------------------------------------------------------------------------------
extension StudentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectsTableViewCell", for: indexPath) as! SubjectsTableViewCell
            // cell.config()
            cell.delegat = self
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as! NewTableViewCell
            //cell.config()
            cell.delegat = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FollowTableViewCell", for: indexPath) as! FollowTableViewCell
            //   cell.config()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
//--------------------------------------------------------------------------------------------------------
extension StudentViewController: SubjectDelegat, NewDelegat {
    
    func selectedSubject() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let destnation = storybord.instantiateViewController(withIdentifier: "SubjectViewController") as! SubjectViewController
        present(destnation, animated: true, completion: nil)
    }
    
    func videoSelected() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let destnation = storybord.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
        present(destnation, animated: true, completion: nil)
    }
    
    func examSelected() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let destnation = storybord.instantiateViewController(withIdentifier: "ExamResultViewController") as! ExamResultViewController
        present(destnation, animated: true, completion: nil)
    }
    
    func questionBankSelected() {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let destnation = storybord.instantiateViewController(withIdentifier: "QuestionsBankViewController") as! QuestionsBankViewController
        present(destnation, animated: true, completion: nil)
    }
}
//---------------------------------------------------------------------------------------------------------
