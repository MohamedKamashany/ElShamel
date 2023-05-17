//
//  SubjectPresenter.swift
//  Elshamel
//
//  Created by mohamed rafik on 06/05/2023.
//

import Foundation

protocol SubjectPresenterProtocol {
    var view: SubjectViewProtocol? { get set }
    func presentMaterialParts(_ parts: [Parts])
    func presentPartChapters(_ chapters: [Chapters])
    func showError(_ error: NetWorkError)
    func presentSelectedPart(with name: String?)
    func presentSelectedChapter(with name: String?)
    func presentContent(with statusList: [Bool])
    func presentVideo(with list: [Videos])
    func presentExams(with list: [Exams])
    func presentPDFs(with list: [Pdfs])
}

class SubjectPresenter: SubjectPresenterProtocol {
    
    var view: SubjectViewProtocol?
    
    func presentMaterialParts(_ parts: [Parts]) {
        view?.showMaterialParts(parts)
    }
    
    func presentPartChapters(_ chapters: [Chapters]) {
        view?.showPartChapters(chapters)
    }
    
    func showError(_ error: NetWorkError) {
        view?.showError(with: error.errorType?.getMessage() ?? "")
    }
    
    func presentSelectedPart(with name: String?) {
        
    }
    
    func presentSelectedChapter(with name: String?) {
        
    }
    
    func presentContent(with statusList: [Bool]) {
        view?.setVideoSelection(statusList[0])
        view?.setPDFSelection(statusList[1])
        view?.setExamselection(statusList[2])
    }
    
    func presentVideo(with list: [Videos]) {
        view?.showVideosView(with: list)
    }
    
    func presentExams(with list: [Exams]) {
        view?.showExamsView(with: list)
    }
    
    func presentPDFs(with list: [Pdfs]) {
        view?.showPDFsView(with: list)
    }
}
