import Foundation
struct Movie: Codable, Identifiable {
    var id: String
    var url: String?
    var primaryTitle: String?
    var originalTitle: String?
    var type: String?
    var description: String?
    var primaryImage: String?
    var thumbnails: [Thumbnail]?
    var trailer: String?
    var contentRating: String?
    var startYear: Int?
    var endYear: Int?
    var releaseDate: String?
    var interests: [String]?
    var countriesOfOrigin: [String]?
    var externalLinks: [String]?
    var spokenLanguages: [String]?
    var filmingLocations: [String]?
    var productionCompanies: [ProductionCompany]?
    var budget: Int?
    var grossWorldwide: Int?
    var genres: [String]?
    var isAdult: Bool?
    var runtimeMinutes: Int?
    var averageRating: Double?
    var numVotes: Int?
    var metascore: Int?
    var directors: [Directors]?
    var writers: [Directors]?
    var cast: [Cast]?
}

struct Thumbnail: Codable {
    var url: String
    var width: Int
    var height: Int
}

struct ProductionCompany: Codable {
    var id: String
    var name: String
}

struct Directors : Codable {
    var id: String
    var url: String
    var fullName: String
}

struct Cast : Codable, Identifiable {
    var id: String
    var url: String
    var fullName: String
    var primaryImage : String?
    var thumbnails: [Thumbnail]?
    var job: String
    var characters: [String]
}


