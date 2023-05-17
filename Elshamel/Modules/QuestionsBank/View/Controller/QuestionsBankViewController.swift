//
//  QuestionsBankViewController.swift
//  Elshamel
//
//  Created by mohamed rafik on 12/01/2023.
//

import UIKit
import SDWebImage
import FirebaseDatabase

protocol QuestionsBankViewProtocol: LoaderView, ErrorView {
    var interactor: QuestionsBankInteractorProtocol? { get set }
    func showQuestions(question: [Questions])
}


class QuestionsBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var questionsLbl: UILabel!
    @IBOutlet weak var questionsTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    var interactor: QuestionsBankInteractorProtocol?
//    var questions: [Question] = [
//        Question(name: "", answers: <#T##[Answer]?#>)
//    ]
    var exam: Exams?
    var questions = [Questions]()
    var selectedMaterial: Material?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setBtns()
        interactor?.getExamContent(exam_id: exam?.id ?? 0)
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        questionsTableView.register(UINib(nibName: "AnswersTableViewCell", bundle: nil), forCellReuseIdentifier: "AnswersTableViewCell")
        questionsTableView.rowHeight = UITableView.automaticDimension
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersTableViewCell", for: indexPath) as! AnswersTableViewCell
        cell.config(with: questions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
    
    func configUI() {
        subjectLbl.text = selectedMaterial?.name
        subjectImageView.sd_setImage(with: URL(string: selectedMaterial?.image ?? ""), placeholderImage: UIImage(named: ""))
    }
    
    @IBAction func nextBtn(_ sender: Any) {
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}


extension QuestionsBankViewController: QuestionsBankViewProtocol {
    
    func showQuestions(question: [Questions]) {
        DispatchQueue.main.async {
            self.questions = question
            self.questionsTableView.reloadData()
        }
    }
    
    func showError(with message: String) {
        let errorMessage = UIAlertController(title: "خطأ", message: message, preferredStyle: .alert)
        errorMessage.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: nil))
        present(errorMessage, animated: true, completion: nil)
    }
    
    func hideErrorView() {
        
    }
    
    
}
