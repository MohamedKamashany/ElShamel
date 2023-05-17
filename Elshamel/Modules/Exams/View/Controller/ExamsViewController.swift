//
//  ExamsViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 02/05/2023.
//

import UIKit
import SDWebImage

class ExamsViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var examsLbl: UILabel!
    @IBOutlet weak var examsTableView: UITableView!
    
    var exams: [Exams]?
    var selectedMaterial: Material?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        config()
    }
    
    func setupTableView() {
        examsTableView.delegate = self
        examsTableView.dataSource = self
        examsTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
        examsTableView.rowHeight = UITableView.automaticDimension
    }
    
    func config() {
        subjectLbl.text = selectedMaterial?.name
        subjectImageView.sd_setImage(with: URL(string: selectedMaterial?.image ?? ""), placeholderImage: UIImage(named: ""))
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}


extension ExamsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exams?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        cell.config()
        cell.videoLbl.text = exams?[indexPath.row].name ?? ""
        cell.videoImg.image = UIImage(named: "exam")
        cell.sectionLbl.text = exams?[indexPath.row].type_label ?? ""
        cell.chapterLbl.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let isFree = exams?[indexPath.row].is_free {
            if isFree == true {
                 let _ = exams?[indexPath.row]
                guard let view = QuestionBankConfigurator().createModule() as? QuestionsBankViewController  else { return }
                view.exam = self.exams?[indexPath.row]
                view.selectedMaterial = self.selectedMaterial
                present(view, animated: true)
                
            } else if isFree == false {
                guard let view = UIStoryboard(name: "Subscription", bundle: nil).instantiateViewController(withIdentifier: "SubscriptionViewController") as? SubscriptionViewController else { return }
//                self.navigationController?.pushViewController(view, animated: true)
                present(view, animated: true, completion: nil)
            }
        }
    }
    
    
}
