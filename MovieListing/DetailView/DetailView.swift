import SwiftUI
import Combine

struct DetailView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                AsyncImage(url: viewModel.movieThumbnailURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ZStack {
                        Color.gray.opacity(0.3)
                        ProgressView()
                    }
                    .frame(height: 200)
                }

                HStack(alignment: .top, spacing: 16) {
                    AsyncImage(url: viewModel.movieImageUrl) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 150)
                            .clipped()
                            .cornerRadius(8)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                            .frame(width: 100, height: 150)
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text(viewModel.movieTitle)
                            .font(.title2).bold()
                            .foregroundColor(.white)

                        Text("\(ConstantsStrings.directors.rawValue): \(viewModel.movieDirectors)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("\(ConstantsStrings.runtime.rawValue): \(viewModel.movieDuration)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text(viewModel.movieGenres)
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(viewModel.movieRating)
                                .foregroundColor(.gray)
                        }
                        .font(.subheadline)
                    }
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 8) {
                    Text(ConstantsStrings.plotSummary.rawValue)
                        .font(.headline)
                        .foregroundColor(.white)

                    Text(viewModel.movieSumaury)
                        .foregroundColor(.gray)
                        .font(.body)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 8) {
                    Text(ConstantsStrings.cast.rawValue)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.movieCast, id: \.id) { cast in
                                CastCard(cast: cast)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    DetailView(viewModel: MovieDetailsViewModel(apiService: MockSuccessApiService()))
}
