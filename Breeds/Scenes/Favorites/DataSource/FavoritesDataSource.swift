import UIKit

final class FavoritesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var favoriteList: [BreedEntity]
    var favoriteTableView: UITableView
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
