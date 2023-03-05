//
//  ExamsResultTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 23/01/2023.
//

import UIKit

class ExamsResultTableViewCell: UITableViewCell {

    @IBOutlet weak var examsResultLbl: UILabel!
    @IBOutlet weak var examsResultCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        examsResultCollectionView.delegate = self
        examsResultCollectionView.dataSource = self
        examsResultCollectionView.register(UINib(nibName: "ExamsResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExamsResultCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config() {
        examsResultCollectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .right, animated: true)
    }
}
//___________________________________________________________________________________________

extension ExamsResultTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExamsResultCollectionViewCell", for: indexPath) as! ExamsResultCollectionViewCell
        cell.setContainerView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 90)
    }

}
