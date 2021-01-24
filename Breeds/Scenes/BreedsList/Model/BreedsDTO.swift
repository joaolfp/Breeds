import Foundation

struct BreedsDTO: Codable {
    var id: Int
    var name: String
    var temperament: String?
    var description: String?
    var life_span: String
    var image: BreedsImage
    var weight: BreedsWeight
    var height: BreedsHeight
}

struct BreedsImage: Codable {
    var url: String
}

struct BreedsWeight: Codable {
    var metric: String
    var imperial: String
}

struct BreedsHeight: Codable {
    var metric: String
    var imperial: String
}
