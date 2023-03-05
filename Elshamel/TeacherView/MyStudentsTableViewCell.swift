//
//  MyStudentsTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 23/01/2023.
//

import UIKit

class MyStudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var studentsLbl: UILabel!
    @IBOutlet weak var everyOneButton: UIButton!
    @IBOutlet weak var MystudentsCollectionView: UICollectionView!
    @IBOutlet weak var addStudentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCollectionview()
    }
    
    func setupCollectionview() {
        MystudentsCollectionView.delegate = self
        MystudentsCollectionView.dataSource = self
        MystudentsCollectionView.register(UINib(nibName: "MyStudentsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyStudentsCollectionViewCell")
    }
    
    func config() {
        MystudentsCollectionView.scrollToItem(at: IndexPath(row: 9, section: 0), at: .left, animated: true)
    }
    
    @IBAction func everyOneBtn(_ sender: Any) {
    }
    
    @IBAction func addStudentBtn(_ sender: Any) {
    }
}
//___________________________________________________________________________________________

extension MyStudentsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyStudentsCollectionViewCell", for: indexPath) as! MyStudentsCollectionViewCell
        cell.setContainerView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 90)
    }
    
}


