//
//  ContentView.swift
//  AbumereErikaHW5
//
//  
//

import SwiftUI

struct ContentView: View {
    
    @State var flashcardViewModel = FlashcardViewModel()
    var body: some View {
        MainTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
        
}
