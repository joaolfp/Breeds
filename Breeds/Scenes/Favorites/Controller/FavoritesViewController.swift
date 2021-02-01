import UIKit

final class FavoritesViewController: UIViewController {
    
    private(set) var favoritesView = FavoritesView()
    private(set) var breedList = [BreedEntity]()
    private let databaseManager = DatabaseManager()

    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesView.favoritesTableView.delegate = self
        favoritesView.favoritesTableView.dataSource = self
        
        breedList = databaseManager.fetchAll()
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesView.favoritesTableView.addCell(for: indexPath, cellType: FavoritesViewCell.self)
        
        let breed = breedList[indexPath.row]
        
        cell.name.text = breed.name
        
        return cell
    }
}
