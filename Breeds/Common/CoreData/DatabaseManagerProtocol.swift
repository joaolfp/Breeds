import Foundation

protocol DatabaseManagerProtocol {
    func createBreeds(id: Int, name: String, photo: String)
    func fetch()
    func fetchAll() -> [BreedEntity]
    func getById(detailsView: DetailsView, breedsItems: BreedsDTO)
    func deleteBreed(id: Int)
}
