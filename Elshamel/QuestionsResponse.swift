//
//  QuestionsResponse.swift
//  Elshamel
//
//  Created by mohamed rafik on 12/01/2023.

import Foundation

class QuestionsResponse {
    
    var status: String?
    var response: [Question]?
}

class Question {
    
    var name:String?
    var answers:[Answer]?
    
    internal init(name: String? = nil, answers: [Answer]? = nil) {
        self.name = name
        self.answers = answers
    }
    
}

class Answer {
    
    var name: String?
    var isSelected: Bool = false
    
    internal init(name: String? = nil, isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
}
