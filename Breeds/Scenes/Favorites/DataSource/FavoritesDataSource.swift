import UIKit

final class FavoritesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var favoriteList: [BreedEntity]
    var favoriteTableView: UITableView
    private var databaseManager = DatabaseManager()
    
    init(favoriteList: [BreedEntity], favoriteTableView: UITableView) {
        self.favoriteList = favoriteList
        self.favoriteTableView = favoriteTableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.addCell(for: indexPath, cellType: FavoritesViewCell.self)
        
        let breedFavorite = favoriteList[indexPath.row]
        cell.photo.download(image: breedFavorite.photo ?? "" )
        cell.name.text = breedFavorite.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let index = indexPath.row
            let breed = favoriteList[index]
            favoriteList.remove(at: index)
            databaseManager.deleteBreed(id: Int(breed.id))
            favoriteTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
