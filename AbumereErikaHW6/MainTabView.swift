//
//  MainTabView.swift
//  AbumereErikaHW6
//
//  
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @StateObject var flashcardViewModel = FlashcardViewModel()
    
    var body: some View {
        TabView{
            FlashcardPage()
                .tabItem {
                    Label("Question", systemImage: "questionmark")
                }
            FlashcardListPage()
                .tabItem {
                    Label("Cards", systemImage: "square.stack.3d.up.fill")
                }
            FavoritesFlashcardListPage()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
        .environmentObject(flashcardViewModel)
        
    }
}

