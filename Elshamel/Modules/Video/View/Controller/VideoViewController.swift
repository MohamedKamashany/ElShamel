//
//  VideoViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 08/01/2023.
//

import UIKit
import SafariServices

class VideoViewController: UIViewController {
    
    @IBOutlet weak var videoLbl: UILabel!
    @IBOutlet weak var videoLbl2: UILabel!
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    var videos: [Videos]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setBtns()
        
    }
    
    func setupTableView() {
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
        //        videoTableView.rowHeight = UITableView.automaticDimension
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
    
    
    @IBAction func nextVideoBtn(_ sender: Any) {
    }
    
    @IBAction func previousVideoBtn(_ sender: Any) {
        dismiss(animated: false)
    }
    
}


extension VideoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        cell.config()
        cell.sectionLbl.text = videos?[indexPath.row].name ?? ""
        cell.chapterLbl.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let isFree = videos?[indexPath.row].is_free {
            if isFree == true {
                guard let video = videos?[indexPath.row].file else { return }
                let safariVC = SFSafariViewController(url: (URL(string: video)!))
                present(safariVC, animated: true)
//                let view = UIStoryboard(name: "Video", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
//                view.videoURL = video
//                present(view, animated: true)
            }else if isFree == false {
                let view = UIStoryboard(name: "Subscription", bundle: nil).instantiateViewController(withIdentifier: "SubscriptionViewController") as! SubscriptionViewController
                present(view, animated: true, completion: nil)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
