//
//  NotificationViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 05/01/2023.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NotficationDelegat {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationLbl: UILabel!
    @IBOutlet weak var notificationTableView: UITableView!
    
    var arrNotioficaion: [Int] = [1, 2, 3, 4, 5]

    override func viewDidLoad() {
        super.viewDidLoad()

        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        notificationTableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
//        notificationTableView.rowHeight = UITableView.automaticDimension
        backButton.tintColor = AppColors.textColor
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotioficaion.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.config()
        cell.delegat = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.arrNotioficaion.remove(at: indexPath.row)
            self.notificationTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 95
    }
    
    @IBAction func backBtn(_ sender: Any) {
    }
    
    func delete() {
        notificationTableView.isEditing = !notificationTableView.isEditing
    }
    
}
