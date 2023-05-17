//
//  SubjectsTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 24/01/2023.
//

import UIKit

protocol SubjectDelegat {
    func selectedMaterial(selectedMaterial: Material)
}

class SubjectsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var subjectsLbl: UILabel!
    @IBOutlet weak var subjectsCollectionView: UICollectionView!
    
    var delegat: SubjectDelegat?
//    var arrSubject: [Int] = [1, 2, 3, 4, 5, 6]
    var materialArr = AppData.shared.materials
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCollectionview()
    }
    
    func setupCollectionview() {
        subjectsCollectionView.delegate = self
        subjectsCollectionView.dataSource = self
        subjectsCollectionView.register(UINib(nibName: "SubjectsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SubjectsCollectionViewCell")
    }
    
    func config() {
        subjectsCollectionView.scrollToItem(at: IndexPath(row: 9, section: 0), at: .left, animated: true)
    }
}
//___________________________________________________________________________________________

extension SubjectsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return materialArr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCollectionViewCell", for: indexPath) as! SubjectsCollectionViewCell
        if let materialArr = materialArr?[indexPath.row] {
            cell.config(material: materialArr)
        }
        return cell
//        if indexPath.row == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCollectionViewCell", for: indexPath) as! SubjectsCollectionViewCell
//            cell.setContainerView()
//            return cell
//        } else if indexPath.row == 1 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCollectionViewCell", for: indexPath) as! SubjectsCollectionViewCell
//            cell.setContainerView()
//            cell.subjectImageView.image = UIImage(named: "chemistry")
//            cell.subjectLbl.text = "الكيمياء"
//            return cell
//        }else if indexPath.row == 2 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCollectionViewCell", for: indexPath) as! SubjectsCollectionViewCell
//            cell.setContainerView()
//            cell.subjectImageView.image = UIImage(named: "Biology")
//            cell.subjectLbl.text = "الاحياء"
//            return cell
//        }else if indexPath.row == 3 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCollectionViewCell", for: indexPath) as! SubjectsCollectionViewCell
//            cell.setContainerView()
//            cell.subjectImageView.image = UIImage(named: "Arabic")
//            cell.subjectLbl.text = "اللغةالعربية"
//            return cell
//        }else if indexPath.row == 4 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCollectionViewCell", for: indexPath) as! SubjectsCollectionViewCell
//            cell.setContainerView()
//            cell.subjectImageView.image = UIImage(named: "math")
//            cell.subjectLbl.text = "الرياضيات"
//            return cell
//        }else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCollectionViewCell", for: indexPath) as! SubjectsCollectionViewCell
//            cell.setContainerView()
//            cell.subjectImageView.image = UIImage(named: "geology")
//            cell.subjectLbl.text = "الجيولوجيا"
//            return cell
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let materialArr = materialArr?[indexPath.row] {
            self.delegat?.selectedMaterial(selectedMaterial: materialArr)
        }
    }
}

