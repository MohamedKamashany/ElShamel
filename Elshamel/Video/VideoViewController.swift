//
//  VideoViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 08/01/2023.
//

import UIKit

class VideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var videoLbl: UILabel!
    @IBOutlet weak var videoLbl2: UILabel!
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setBtns()
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
//        videoTableView.rowHeight = UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        cell.config()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
