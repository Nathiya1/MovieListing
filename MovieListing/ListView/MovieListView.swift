//
//  MovieListView.swift
//  MovieListing
//
//  Created by NATHIYA on 10/07/25.
//

import SwiftUI

struct MovieListView: View {
    let movies: [Movie]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            List(movies) { movie in
                NavigationLink(destination: MovieDetailView(id: movie.id)) {
                    MovieCardView(movie: movie)
                }
                .listRowBackground(Color.black) // Row background
            }
            .scrollContentBackground(.hidden) // Hide List's default bg
            .background(Color.black) // List bg
        }
    }
}
