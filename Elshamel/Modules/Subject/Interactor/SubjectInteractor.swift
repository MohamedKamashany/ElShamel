//
//  SubjectInteractor.swift
//  Elshamel
//
//  Created by mohamed rafik on 06/05/2023.
//

import Foundation
import Alamofire

protocol SubjectInteractorProtocol {
    var presenter: SubjectPresenterProtocol? { get set }
    
    func getMaterialContent()
    func getParts()
    func getChapters()
    
    func setMaterial(_ material: Material?)
    func setFirstSemester()
    func setSecondSemester()
    func setSelectedPart(with partName: String)
    func setSelectedChapter(with chapterName: String)
    func getChapterContent(with id: Int)
    func selectNext(from checkList: [Bool])
}

class SubjectInteractor: SubjectInteractorProtocol {
    
    private let firstSemester = "First semester"
    private let secondSemester = "Second semester"
    
    var presenter: SubjectPresenterProtocol?
    private var selectedMaterial: Material?
    private var selectedSubject: SubjectResponse?
    private var selectedSmester: String?
    private var selectedPart: Parts?
    private var selectedChapter: Chapters?
    
    private var chapterContent: ChapterResponse?
    
    init() {
        self.selectedSmester = firstSemester
    }
    
    func getMaterialContent() {
        guard let v4apiKey = LogedInUser.shared.token else { return }
        guard let semster = selectedSmester else { return }
        guard let materialID = selectedMaterial?.id else { return }
        guard let gradeID = LogedInUser.shared.userData?.gradeID else { return }
        
        let headers = ["Authorization": "Bearer \(v4apiKey)"]
        let parameters = ["material_id": "\(materialID)",
                          "grade_id": "\(gradeID)",
                          "semester": semster]
        presenter?.view?.startLoading()
        if NetworkManager.shared.isInternetAvailable() {
            NetworkManager.shared.processReq(url: .getMaterials,
                                             method: .get,
                                             bodyParams: parameters,
                                             returnType: SubjectResponse.self, headers: headers) { [weak self] result in
                self?.presenter?.view?.stopLoading()
                switch result {
                case .success(let response):
                    if let data = response {
                        self?.selectedPart = nil
                        self?.selectedChapter = nil
                        self?.selectedSubject = data
                    }else if let errors = response?.errors {
                        if let errorMessage = errors.values.first?.first {
                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.backendError(errorMessage)))
                        }else{
                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                        }
                    }else {
                        self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                    }

                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.presenter?.showError(error)
                    }
                    print(error.errorType?.getMessage() ?? "")
                }
            }
        }else{
            let error = NetWorkError(errorType: .noInternet)
            presenter?.showError(error)
        }

    }
    
    func getParts() {
        if let selectedSubject = selectedSubject, let parts = selectedSubject.data?.parts {
            presenter?.presentMaterialParts(parts)
        }
    }
    
    func getChapters() {
        if let chapters = selectedPart?.chapters {
            presenter?.presentPartChapters(chapters)
        }
    }
    
    func setMaterial(_ material: Material?) {
        self.selectedMaterial = material
    }
    
    func setFirstSemester() {
        if firstSemester != selectedSmester {
            self.selectedSmester = firstSemester
            self.getMaterialContent()
        }
    }
    
    func setSecondSemester() {
        if secondSemester != selectedSmester {
            self.selectedSmester = secondSemester
            self.getMaterialContent()
        }
    }
    func setSelectedPart(with partName: String) {
        if let choosenPart = selectedSubject?.data?.parts.first(where: { part in
            part.name == partName
        }) {
            self.selectedPart = choosenPart
        }
    }
    
    func setSelectedChapter(with chapterName: String) {
        if let choosenChapter = selectedPart?.chapters.first(where: { chapter in
            chapter.name == chapterName
        }) {
            self.selectedChapter = choosenChapter
            self.getChapterContent(with: selectedChapter?.id ?? 0)
        }
    }
    
    func getChapterContent(with id: Int) {
        guard let v4apiKey = LogedInUser.shared.token else { return }
        let headers = ["Authorization": "Bearer \(v4apiKey)"]
        let parameters = ["with": "pdfs,videos,exams"]
        presenter?.view?.startLoading()
        if NetworkManager.shared.isInternetAvailable() {
            NetworkManager.shared.processReq(url: .getChapterContent,
                                             method: .get,
                                             addedExtra: "\(id)",
                                             bodyParams: parameters,
                                             returnType: ChapterResponse.self, headers: headers) { [weak self] result in
                self?.presenter?.view?.stopLoading()
                switch result {
                case .success(let response):
                    if let data = response {
                        self?.chapterContent = data
                        self?.handleSelectionStatus(from: data)
                    }else if let errors = response?.errors {
                        if let errorMessage = errors.values.first?.first {
                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.backendError(errorMessage)))
                        }else{
                            self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                        }
                    }else {
                        self?.presenter?.showError(NetWorkError(errorType: ElShamelErrorType.serverError))
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.presenter?.showError(error)
                    }
                    print(error.errorType?.getMessage() ?? "")
                }
            }
        }else{
            let error = NetWorkError(errorType: .noInternet)
            presenter?.showError(error)
        }
    }
    
    private func handleSelectionStatus(from: ChapterResponse) {
        var selectionStatusList: [Bool] = [false, false, false]
        if from.data?.videos.count ?? 0 > 0 {
            selectionStatusList[0] = true
        }
        
        if from.data?.pdfs.count ?? 0 > 0 {
            selectionStatusList[1] = true
        }
        
        if from.data?.exams.count ?? 0 > 0 {
            selectionStatusList[2] = true
        }
        presenter?.presentContent(with: selectionStatusList)
    }

    
    func selectNext(from checkList: [Bool]) {
        var index = 0
        for isChecked in checkList {
            if (isChecked && index == 0) {
                if let videos = chapterContent?.data?.videos {
                    presenter?.presentVideo(with: videos)
                }
            }else if (isChecked && index == 1) {
                if let pdfs = chapterContent?.data?.pdfs {
                    presenter?.presentPDFs(with: pdfs)
                }
            }else if (isChecked && index == 2) {
                if let exams = chapterContent?.data?.exams {
                    presenter?.presentExams(with: exams)
                }
            }
            index += 1
        }
    }

}
