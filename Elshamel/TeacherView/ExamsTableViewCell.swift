//
//  ExamsTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 23/01/2023.
//

import UIKit

class ExamsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var examsLbl: UILabel!
    @IBOutlet weak var examsCollectionView: UICollectionView!
    @IBOutlet weak var addexamButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCollectionview()
    }
    
    func setupCollectionview() {
        examsCollectionView.delegate = self
        examsCollectionView.dataSource = self
        examsCollectionView.register(UINib(nibName: "ExamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExamsCollectionViewCell")
    }
    
    func config() {
        examsCollectionView.scrollToItem(at: IndexPath(row: 9, section: 0), at: .left, animated: true)
    }
    
    @IBAction func addExamBtn(_ sender: Any) {
    }
}
//___________________________________________________________________________________________

extension ExamsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExamsCollectionViewCell", for: indexPath) as! ExamsCollectionViewCell
        cell.setContainerView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 90)
    }

}
