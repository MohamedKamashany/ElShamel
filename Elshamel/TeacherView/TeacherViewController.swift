//
//  TeacherViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 23/01/2023.


import UIKit

class TeacherViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var teacherLbl: UILabel!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var teacherTableView: UITableView!
    @IBOutlet weak var notificationButton: UIButton!
    
    var sideMenu: MainViewController? {
        revealViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teacherTableView.delegate = self
        teacherTableView.dataSource = self
        teacherTableView.register(UINib(nibName: "MyStudentsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyStudentsTableViewCell")
        teacherTableView.register(UINib(nibName: "ExamsTableViewCell", bundle: nil), forCellReuseIdentifier: "ExamsTableViewCell")
        teacherTableView.register(UINib(nibName: "ExamsResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ExamsResultTableViewCell")
        teacherTableView.rowHeight = UITableView.automaticDimension
    }
 
    @IBAction func sideMenuBtn(_ sender: Any) {
        sideMenu?.revealSideMenu()
    }
    
    @IBAction func notificationBtn(_ sender: Any) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let destnation = storybord.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        present(destnation, animated: true, completion: nil)
    }
}
//--------------------------------------------------------------------------------------------------------

extension TeacherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyStudentsTableViewCell", for: indexPath) as! MyStudentsTableViewCell
           // cell.config()
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExamsTableViewCell", for: indexPath) as! ExamsTableViewCell
            //cell.config()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExamsResultTableViewCell", for: indexPath) as! ExamsResultTableViewCell
         //   cell.config()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
//--------------------------------------------------------------------------------------------------------
