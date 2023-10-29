//
//  FlashcardCell.swift
//  AbumereErikaHW6
//
//  Created by Student on 10/28/23.
//

import Foundation
import SwiftUI

struct FlashcardCell: View {
    let flashcard: Flashcard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(flashcard.question)
                .font(.title3)
            Text(flashcard.answer)
                .font(.subheadline)
        }
    }
}

struct FlashcardCell_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFlashcard = Flashcard(id: UUID(), question: "Sample Question", answer: "Sample Answer", isFavorite: false)
        FlashcardCell(flashcard: sampleFlashcard)

    }
}
