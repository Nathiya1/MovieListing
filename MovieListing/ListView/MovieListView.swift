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
                .listRowBackground(Color.black)}.scrollContentBackground(.hidden).background(Color.black)
        }
    }
}
