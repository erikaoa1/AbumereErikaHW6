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
    @State var refresh: Bool = false
    
    func refreshView(){
        flashcardViewModel.objectWillChange.send()
    }
    
    var body: some View {
        NavigationStack{
            List($flashcardViewModel.flashcards, id: \.id, editActions: .delete) { $flashcard in
                NavigationLink(destination: EditFlashCardPage(flashcard: flashcard)){

                    FlashcardCell(flashcard: flashcard)
                        .id(UUID())
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
        }
    }
    




