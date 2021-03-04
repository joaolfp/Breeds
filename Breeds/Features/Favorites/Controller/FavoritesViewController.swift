import UIKit

final class FavoritesViewController: UIViewController {
    
    private(set) var favoritesView = FavoritesView()
    internal var favoriteList = [BreedEntity]()
    internal var databaseManager = DatabaseManager()
    internal var searchBar: UISearchBar = UISearchBar()
    internal var filteredFavorite = [BreedEntity]()
    internal var inSearchMode = false
    
    private(set) var dataSource: FavoritesDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            
            favoritesView.favoritesTableView.delegate = dataSource
            favoritesView.favoritesTableView.dataSource = dataSource
            favoritesView.favoritesTableView.reloadData()
        }
    }

    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoriteList = databaseManager.fetchAll()
        setupDataSource()
    }
    
    func setupDataSource() {
        dataSource = FavoritesDataSource(favoriteList: favoriteList, favoriteTableView: favoritesView.favoritesTableView,
                                         searchBar: searchBar, filteredFavorite: filteredFavorite, inSearchMode: inSearchMode)
    }
}
