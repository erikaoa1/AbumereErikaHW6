//
//  ContentView.swift
//  AbumereErikaHW5
//
//  
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        MainTabView()
            .environmentObject(FlashcardViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
        
}
