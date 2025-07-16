import Foundation

class MovieViewModel : ObservableObject {
    
    @Published var movies : [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage : String? = nil
    
    var apiService : MovieServiceProtocol
    
    init(apiService:MovieServiceProtocol) {
        self.apiService = apiService
    }
    
    @MainActor
    func fetchMovie() async {
        isLoading = true
         if NetworkMonitor.shared.isConnected {
            errorMessage = nil
            do {
                self.movies = try await apiService.fetchMovies()
                isLoading = false
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
            }
        }
        else {
            isLoading = false
            errorMessage = ConstantsStrings.noInternetConnection.rawValue
        }
    }
}
