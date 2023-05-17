//
//  AnswersTableViewCell.swift
//  Elshamel
//
//  Created by mohamed rafik on 18/01/2023.
//

import UIKit
import SwiftyJSON
import SDWebImage

class AnswersTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionTextLabelHeightConstraint: NSLayoutConstraint!
    
    private(set) var selectedQuestion: Questions?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionview()
    }
    
    func setupCollectionview() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TextAnswerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TextAnswerCollectionViewCell")
        collectionView.register(UINib(nibName: "ImageAnswerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageAnswerCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func config(with question: Questions) {
        self.selectedQuestion = question
        setQuestionUI(from: question)
        setAnswersDirectionUI(from: question)
        setQuestionValuesUI(from: question)
        collectionView.reloadData()
    }
    
    private func setQuestionUI(from question: Questions) {
        if let _ = question.title, let _ = question.image {
            questionImageViewHeightConstraint.constant = 150
            questionTextLabelHeightConstraint.constant = 41
        }else if let _ = question.title {
            questionTextLabelHeightConstraint.constant = 41
            questionImageViewHeightConstraint.constant = 0
        }else if let _ = question.image {
            questionImageViewHeightConstraint.constant = 150
            questionTextLabelHeightConstraint.constant = 0
        }
    }
    
    private func setAnswersDirectionUI(from question: Questions) {
        if question.answers?.count ?? 0 > 0 {
            if let _ = question.answers?.first?.image {
                if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                }
            }else{
                if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .vertical
                }
            }
        }
    }
    
    private func setQuestionValuesUI(from question: Questions) {
        if let body = question.body, let imageURLStr = question.image {
            questionImageView.sd_setImage(with: URL(string: imageURLStr),
                                          placeholderImage: UIImage(named: ""),
                                          options: .lowPriority,
                                          context: nil)
            questionTextLabel.text = body
        }else if let body = question.body {
            questionTextLabel.text = body
        }else if let imageURLStr = question.image {
            questionImageView.sd_setImage(with: URL(string: imageURLStr),
                                          placeholderImage: UIImage(named: ""),
                                          options: .lowPriority,
                                          context: nil)
        }
    }
    
}
//___________________________________________________________________________________________

extension AnswersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedQuestion?.answers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let _ = selectedQuestion?.answers?[indexPath.row].image {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageAnswerCollectionViewCell", for: indexPath) as! ImageAnswerCollectionViewCell
            if let selectedAnswer = selectedQuestion?.answers?[indexPath.row] {
                cell.config(with: selectedAnswer)
            }
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextAnswerCollectionViewCell", for: indexPath) as! TextAnswerCollectionViewCell
            if let selectedAnswer = selectedQuestion?.answers?[indexPath.row] {
                cell.config(with: selectedAnswer)
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let _ = selectedQuestion?.answers?[indexPath.row].image {
            return CGSize(width: 150, height: 170)
        }else{
            return CGSize(width: collectionView.bounds.width, height: 30)
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
