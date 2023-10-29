//
//  Flashcard.swift
//  AbumereErikaHW5
//
//  Created by Student on 10/9/23.
//

import Foundation

struct Flashcard : Hashable, Identifiable, Codable {
    let id: UUID
    let question: String
    let answer: String
    let isFavorite: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Flashcard, rhs: Flashcard) -> Bool {
        return lhs.id == rhs.id
    }
}
