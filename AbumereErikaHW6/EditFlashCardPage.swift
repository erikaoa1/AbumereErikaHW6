//
//  EditFlashCardPage.swift
//  AbumereErikaHW6
//
//  
//

import Foundation
import SwiftUI
struct EditFlashCardPage: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var flashcardViewModel: FlashcardViewModel
    
    
    private var flashcard: Flashcard?
    
    @State private var question = ""
    @State private var answer = ""
    
    @State private var isFavorite = false
    var opperation : String = ""

    init(flashcard: Flashcard? = nil) {
        
        if let flashcard = flashcard {
            self.flashcard = flashcard
            _question = State(initialValue: flashcard.question)
            _answer = State(initialValue: flashcard.answer)
            _isFavorite = State(initialValue: flashcard.isFavorite)
        }
    }
    
    func saveOrCreate(){
        if let flashcard = flashcard{
            for index in 0..<flashcardViewModel.flashcards.count{
                if flashcard == flashcardViewModel.flashcards[index] {
                    flashcardViewModel.flashcards[index] = flashcard
                }
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
            Button("Save") {
                saveOrCreate()
                dismiss()
            }
            .disabled(question.isEmpty || answer.isEmpty)
        }
  
    }
}

struct EditFlashCardPage_Previews: PreviewProvider {
    static var previews: some View {
        EditFlashCardPage()
    }
}
