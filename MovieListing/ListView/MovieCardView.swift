//
//  MovieCardView.swift
//  MovieListing
//
//  Created by NATHIYA on 05/07/25.
//

import SwiftUI

struct MovieCardView: View {
    @State var movie: Movie?
    var body: some View {
        HStack(spacing: 16) {
            // Movie Poster
            AsyncImage(url: URL(string: movie?.thumbnails?.first?.url ?? ""))
                .scaledToFill()
                .frame(width: 60, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            // Movie Details
            VStack(alignment: .leading, spacing: 8) {
                Text(movie?.primaryTitle ?? "")
                    .font(.headline)
                    .foregroundColor(.white)

                Text(movie?.genres?.joined(separator: ", ") ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.subheadline)
                    Text(String(format: "%.1f", movie?.averageRating ?? 0))
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.1))
        .cornerRadius(16)
        .padding(.horizontal)
        .background(Color.black) // This makes the background match the screenshot theme
    }
}
#Preview {
    MovieCardView()
}
