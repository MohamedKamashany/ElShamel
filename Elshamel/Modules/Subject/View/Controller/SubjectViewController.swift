//
//  Subject.swift
//  Elshamel
//
//  Created by mohamed rafik on 12/01/2023.
//

import UIKit
import SDWebImage
import DropDown

struct StatusImage {
    static let selected = UIImage(named: "mark 1")
    static let notSelected = UIImage(named: "mark")
}

protocol SubjectViewProtocol: LoaderView, ErrorView {
    var interactor: SubjectInteractorProtocol? { get set }
    func showMaterialParts(_ parts: [Parts])
    func showPartChapters(_ chapters: [Chapters])
    func setPDFSelection(_ status: Bool)
    func setVideoSelection(_ status: Bool)
    func setExamselection(_ status: Bool)
    
    func showVideosView(with list: [Videos])
    func showExamsView(with list: [Exams])
    func showPDFsView(with list: [Pdfs])
}


class SubjectViewController: UIViewController {

    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var firstSemesterLbl: UILabel!
    @IBOutlet weak var secondSemesterLbl: UILabel!
    @IBOutlet weak var semestersContainerview: UIView!
    @IBOutlet weak var firstSemesterButton: UIButton!
    @IBOutlet weak var secondSemesterButton: UIButton!
    @IBOutlet weak var partLbl: UILabel!
    @IBOutlet weak var partContainerView: UIView!
    @IBOutlet weak var chosePartTxt: UITextField!
    @IBOutlet weak var chosePartButton: UIButton!
    @IBOutlet weak var chapterLbl: UILabel!
    @IBOutlet weak var chapterContainerView: UIView!
    @IBOutlet weak var choseChapterTxt: UITextField!
    @IBOutlet weak var choseChapterButton: UIButton!
    @IBOutlet weak var whatDoYouWantLbl: UILabel!
    
    @IBOutlet weak var watchVideoButton: UIButton!
    @IBOutlet weak var pdfButton: UIButton!
    @IBOutlet weak var examsButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var selectOptionsStack: UIStackView!
    
    var isPDFChecked = false
    var isExamsChecked = false
    var isVideosChecked = false
    
    var selectedMaterial: Material?
    
    var interactor: SubjectInteractorProtocol?
    let optionsNames: [String] = [ "مشاهدة فيديو", "اسئلة وشرح pdf", "امتحانات" ]
    
    let partsDropDown = DropDown()
    let chaptersDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtn()
//        createOptions()
        config()
        interactor?.setMaterial(selectedMaterial)
        interactor?.getMaterialContent()
        let firstTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstSemesterGestureRecognizer))
        firstSemesterLbl.isUserInteractionEnabled = true
        firstSemesterLbl.addGestureRecognizer(firstTapGestureRecognizer)
        let secondTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondSemesterGestureRecognizer))
        secondSemesterLbl.isUserInteractionEnabled = true
        secondSemesterLbl.addGestureRecognizer(secondTapGestureRecognizer)
    }
    
    @objc func firstSemesterGestureRecognizer(sender: UITapGestureRecognizer) {
        firstSemesterButton.setImage(StatusImage.selected, for: .normal)
        secondSemesterButton.setImage(StatusImage.notSelected, for: .normal)
        interactor?.setFirstSemester()
    }
    
    @objc func secondSemesterGestureRecognizer(sender: UITapGestureRecognizer) {
        secondSemesterButton.setImage(UIImage(named: "mark 1"), for: .normal)
        firstSemesterButton.setImage(StatusImage.notSelected, for: .normal)
        interactor?.setSecondSemester()
    }
    
    func setBtn() {
        nextButton.layer.cornerRadius = 20
        nextButton.layer.borderColor = AppColors.borderColor.cgColor
        nextButton.layer.borderWidth = 1
        nextButton.layer.shadowColor = AppColors.borderColor.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        nextButton.layer.shadowOpacity = 0.4
    }
    
    func config() {
        subjectLbl.text = selectedMaterial?.name
        subjectImageView.sd_setImage(with: URL(string: selectedMaterial?.image ?? ""), placeholderImage: UIImage(named: ""))
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func firstSemesterBtn(_ sender: Any) {
        firstSemesterButton.setImage(StatusImage.selected, for: .normal)
        secondSemesterButton.setImage(StatusImage.notSelected, for: .normal)
        interactor?.setFirstSemester()
    }
    
    @IBAction func secondSemesterButton(_ sender: Any) {
        secondSemesterButton.setImage(StatusImage.selected, for: .normal)
        firstSemesterButton.setImage(StatusImage.notSelected, for: .normal)
        interactor?.setSecondSemester()
    }
    
    @IBAction func chosePartBtn(_ sender: Any) {
        interactor?.getParts()
}
    
    @IBAction func choseChapterBtn(_ sender: Any) {
        interactor?.getChapters()
    }
    
    @IBAction func watchVideoBtn(_ sender: Any) {
        if isVideosChecked {
            watchVideoButton.setImage(StatusImage.selected, for: .normal)
            isVideosChecked = false
        } else{
            watchVideoButton.setImage(StatusImage.selected, for: .normal)
            pdfButton.setImage(StatusImage.notSelected, for: .normal)
            examsButton.setImage(StatusImage.notSelected, for: .normal)
            isVideosChecked = true
            isPDFChecked = false
            isExamsChecked = false
        }
    }
    
    @IBAction func pdfBtn(_ sender: Any) {
        if isPDFChecked {
            pdfButton.setImage(StatusImage.notSelected, for: .normal)
            isPDFChecked = true
        }else{
            pdfButton.setImage(StatusImage.selected, for: .normal)
            watchVideoButton.setImage(StatusImage.notSelected, for: .normal)
            examsButton.setImage(StatusImage.notSelected, for: .normal)
            isVideosChecked = false
            isPDFChecked = true
            isExamsChecked = false
        }
    }
    
    @IBAction func examsBtn(_ sender: Any) {
        if isExamsChecked {
            examsButton.setImage(StatusImage.selected, for: .normal)
            isExamsChecked = false
        } else {
            examsButton.setImage(StatusImage.selected, for: .normal)
            watchVideoButton.setImage(StatusImage.notSelected, for: .normal)
            pdfButton.setImage(StatusImage.notSelected, for: .normal)
            isVideosChecked = false
            isPDFChecked = false
            isExamsChecked = true
        }
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        interactor?.selectNext(from: [isVideosChecked, isPDFChecked, isExamsChecked])
    }
        
}


extension SubjectViewController: SubjectViewProtocol {
    
    func showMaterialParts(_ parts: [Parts]) {
        partsDropDown.dataSource.removeAll()
        for part in parts {
            partsDropDown.dataSource.append(part.name ?? "")
        }
        partsDropDown.anchorView = self.chosePartButton //5
        partsDropDown.bottomOffset = CGPoint(x: 0, y: chosePartButton.frame.size.height) //6
        partsDropDown.show() //7
        partsDropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let self = self else { return }
            self.chosePartTxt.text = item
            self.interactor?.setSelectedPart(with: item)
        }
    }
    
    func showPartChapters(_ chapters: [Chapters]) {
        chaptersDropDown.dataSource.removeAll()
        for chapter in chapters {
            chaptersDropDown.dataSource.append(chapter.name ?? "")
        }
        chaptersDropDown.anchorView = self.choseChapterButton //5
        chaptersDropDown.bottomOffset = CGPoint(x: 0, y: choseChapterButton.frame.size.height) //6
        chaptersDropDown.show() //7
        chaptersDropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
            guard let self = self else { return }
            self.choseChapterTxt.text = item
            self.interactor?.setSelectedChapter(with: item)
        }
    }
    
    func showError(with message: String) {
        
    }
    
    func hideErrorView() {
    }
    
    func setVideoSelection(_ status: Bool) {
        DispatchQueue.main.async {
            self.watchVideoButton.isEnabled = status
            }
    }
    
    func setPDFSelection(_ status: Bool) {
        DispatchQueue.main.async {
            self.pdfButton.isEnabled = status
        }
    }
    
    func setExamselection(_ status: Bool) {
        DispatchQueue.main.async {
            self.examsButton.isEnabled = status
        }
    }
    
    func showVideosView(with list: [Videos]) {
        guard let view = VideoConfigurator().createModule() as? VideoViewController else { return }
        view.videos = list
        present(view, animated: true)
    }
    
    func showExamsView(with list: [Exams]) {
        guard let view = ExamsConfigurator().createModule() as? ExamsViewController else { return }
        view.exams = list
        view.selectedMaterial = self.selectedMaterial
        present(view, animated: true)
    }
    
    func showPDFsView(with list: [Pdfs]) {
        //create view
        // set view.list = list
        //navigate
        guard let view = PdfConfigurator().createModule() as? PdfViewController else { return }
        view.pdfs = list
        view.selectedMaterial = self.selectedMaterial
        present(view, animated: true)
    }
    
}
