//
//  NewTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 24/01/2023.
//

import UIKit

protocol NewDelegat {
    func videoSelected()
    func examSelected()
    func questionBankSelected()
}

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newLbl: UILabel!
    @IBOutlet weak var newCollectionView: UICollectionView!
    
    var delegat: NewDelegat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCollectionview()
    }
    
    func setupCollectionview() {
        newCollectionView.delegate = self
        newCollectionView.dataSource = self
        newCollectionView.register(UINib(nibName: "VideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCollectionViewCell")
        newCollectionView.register(UINib(nibName: "ExamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExamsCollectionViewCell")
    }
    
    func config() {
        newCollectionView.scrollToItem(at: IndexPath(row: 9, section: 0), at: .left, animated: true)
    }
}
//___________________________________________________________________________________________

extension NewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
            cell.setContainerView()
            return cell
        }else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExamsCollectionViewCell", for: indexPath) as! ExamsCollectionViewCell
            cell.setContainerView()
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExamsCollectionViewCell", for: indexPath) as! ExamsCollectionViewCell
            cell.setContainerView()
            cell.examImageView.image = UIImage(named: "pdf")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 300, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.delegat?.videoSelected()
        } else if indexPath.row == 1 {
            self.delegat?.examSelected()
        } else {
            self.delegat?.questionBankSelected()
        }
    }
}
