//
//  EditFlashCardPage.swift
//  AbumereErikaHW6
//
//  Created by Student on 10/28/23.
//

import SwiftUI
struct EditFlashCardPage: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var flashcardViewModel: FlashcardViewModel
    
    
    @State private var question = ""
    @State private var answer = ""
    
    @State private var isFavorite = false
    
    private var flashcard: Flashcard?
    init(flashcard: Flashcard? = nil) {
        self.flashcard = flashcard
        
        if let flashcard = flashcard {
            _question = State(initialValue: flashcard.question)
            _answer = State(initialValue: flashcard.answer)
            _isFavorite = State(initialValue: flashcard.isFavorite)
        }
    }
    
    
    func saveOrCreate(){
        if let flashcard = flashcard{
            flashcardViewModel.update(flashcard: flashcard, at: flashcardViewModel.currentIndex)
        
            for card in flashcardViewModel.flashcards{
                
            }
        } else {
            let newFlashcard = Flashcard(id: UUID(), question: question, answer: answer, isFavorite: isFavorite)
            flashcardViewModel.append(flashcard: newFlashcard)
        }
    }

    
    var body: some View {
        VStack(spacing: 24){
            TextField(
                "Question",
                text: $question
            )
            TextField(
                "Answer",
                text: $answer
            )
            Toggle(isOn: $isFavorite){
                Text("Is Favorite?")
            }
            Spacer()
        }
        .padding()
        .navigationTitle(flashcard == nil ? "New Card" : "Edit Card")
        .toolbar{
            Button(action: saveOrCreate){
                Text("Save")
            }
        }
  
    }
}
struct EditFlashCardPage_Previews: PreviewProvider {
    static var previews: some View {
        EditFlashCardPage()
            .environmentObject(FlashcardViewModel())
    }
}
