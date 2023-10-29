//
//  FlashcardListPage.swift
//  AbumereErikaHW6
//
//  
//

import Foundation
import SwiftUI

struct FlashcardListPage: View {
   @EnvironmentObject var flashcardViewModel: FlashcardViewModel
   @State private var refresh = false
   var body: some View {
       NavigationStack{
           List($flashcardViewModel.flashcards, editActions: .delete) { $flashcard in
               NavigationLink(destination: EditFlashCardPage(flashcard: flashcard)) {
                   FlashcardCell(flashcard: flashcard)
               }
           }
           .navigationTitle("Flashcards")
           .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                   NavigationLink(destination: EditFlashCardPage()) {
                       Image(systemName: "plus")
                   }
               }
           }
       }
   }
}

struct FlashcardListPage_Previews: PreviewProvider {
   static var previews: some View {
       FlashcardListPage()
           .environmentObject(FlashcardViewModel())
   }
}
