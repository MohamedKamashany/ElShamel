//
//  FollowTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 24/01/2023.
//

import UIKit

class FollowTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var followingCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCollectionview()
    }
    
    func setupCollectionview() {
        followingCollectionView.delegate = self
        followingCollectionView.dataSource = self
        followingCollectionView.register(UINib(nibName: "FollowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FollowCollectionViewCell")
        followingCollectionView.register(UINib(nibName: "ExamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ExamsCollectionViewCell")
    }
    
    func config() {
        followingCollectionView.scrollToItem(at: IndexPath(row: 9, section: 0), at: .left, animated: true)
    }
}
//___________________________________________________________________________________________

extension FollowTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowCollectionViewCell", for: indexPath) as! FollowCollectionViewCell
            cell.setContainerView()
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExamsCollectionViewCell", for: indexPath) as! ExamsCollectionViewCell
            cell.setContainerView()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 300, height: 90)
    }

}
