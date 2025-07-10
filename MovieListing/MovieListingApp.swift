//
//  MovieListingApp.swift
//  MovieListing
//
//  Created by NATHIYA on 08/04/25.
//

import SwiftUI

@main
struct MovieListingApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        
        // ✅ Set title text color to white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        // ✅ Apply to all UINavigationBars
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
