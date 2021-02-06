import UIKit

final class FavoritesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var favoriteList: [BreedEntity]
    var favoriteTableView: UITableView
    var searchBar: UISearchBar
    var filteredFavorite: [BreedEntity]
    var inSearchMode: Bool = false
    private var databaseManager = DatabaseManager()
    
    init(favoriteList: [BreedEntity], favoriteTableView: UITableView, searchBar: UISearchBar, filteredFavorite: [BreedEntity],
         inSearchMode: Bool) {
        self.favoriteList = favoriteList
        self.favoriteTableView = favoriteTableView
        self.searchBar = searchBar
        self.filteredFavorite = filteredFavorite
        self.inSearchMode = inSearchMode
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredFavorite.count : favoriteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.addCell(for: indexPath, cellType: FavoritesViewCell.self)
        
        let breedFavorite = inSearchMode ? filteredFavorite[indexPath.row] : favoriteList[indexPath.row]
        cell.photo.download(image: breedFavorite.photo ?? "" )
        cell.name.text = breedFavorite.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let index = indexPath.row
            let breed = inSearchMode ? filteredFavorite[index] : favoriteList[index]
            
            if inSearchMode == false {
                favoriteList.remove(at: index)
            } else {
                favoriteList.remove(at: index)
                filteredFavorite.remove(at: index)
            }
            
            databaseManager.deleteBreed(id: Int(breed.id))
            favoriteTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
