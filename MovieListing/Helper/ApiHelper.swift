import Foundation

enum ApiType {
    case listApi
    case detailsApi
}

enum ApiPath : String {
    case listApi  = "https://imdb236.p.rapidapi.com/api/imdb/top250-movies" // "http://localhost:3000/api/movies"
    case detailsApi =  "https://imdb236.p.rapidapi.com/api/imdb/"//"http://localhost:3000/api/movies/tt0068646"//
}

enum APIError: Error {
    case httpStatus(code: Int)
    case decodingFailed(error: Error)
}

let testMovieId = "tt0068646"
let movieAPIKey = "e35b7bc239mshaa56e17894d8ae2p1cd5f1jsna5582bfd07a5"

enum LocalJsonFile : String {
    case list = "Top250movies"
    case details = "MovieDetail"
}

enum JSONLoader {
    static func load<T: Decodable>(_ filename: String,type: T.Type = T.self,bundle: Bundle = .main) -> T {
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Missing file: \(filename).json in bundle: \(bundle)")
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError(" Failed to decode \(filename).json: \(error)")
        }
    }
}

struct ApiRequest {
    let path: String
    var headers = [
        "x-rapidapi-key": movieAPIKey,
        "x-rapidapi-host": "imdb236.p.rapidapi.com"
    ]
    let method = "GET"
    let queryParams: [String: String]?
    
    init(path: String,queryParams: [String: String]? = nil) {
        self.path = path
        self.queryParams = queryParams
    }
    
    func asURLRequest() -> URLRequest? {
        guard var components = URLComponents(string:path) else { return nil }
            
            if let queryParams = queryParams {
                components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
            }
            
            guard let url = components.url else { return nil }
            
            var request = URLRequest(url: url)
            request.httpMethod = method
            headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
            return request
        }
}

enum ConstantsStrings : String {
    case noInternetConnection = "No internet connection"
    case retryConnection = "Retry"
    case error = "Error"
    case loading = "Loading..."
    case directors = "Directors"
    case cast = "Cast"
    case runtime = "Run time"
    case plotSummary = "Plot Summary"
    case headerTitle = "Top 250 Movies"
    case jailbreakDetected = "Jailbreak detected"
    case jailbreakError = "This device appears to be jailbroken.\nFor security reasons, this app cannot run"
    case exitApp = "Exit App"
}
