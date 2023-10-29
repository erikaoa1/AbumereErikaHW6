//
//  FavoritesFlashcardListPage.swift
//  AbumereErikaHW6
//
//  
//

import Foundation
import SwiftUI
struct FavoritesFlashcardListPage: View {
    @EnvironmentObject var flashcardViewModel: FlashcardViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(flashcardViewModel.flashcards.filter { $0.isFavorite }) { flashcard in
                    NavigationLink(destination: EditFlashCardPage(flashcard: flashcard)) {
                        FlashcardCell(flashcard: flashcard)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesFlashcardListPage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesFlashcardListPage()
    }
}
