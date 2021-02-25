import UIKit

extension FavoritesViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
        
    @objc func showSearchBar() {
        configureSearchBar()
    }
                
    func configureSearchBar() {
        favoritesView.searchBarLayout(searchBar: searchBar)
        searchBar.delegate = self
                        
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        setupSearchBar()
        inSearchMode = false
        favoriteList = databaseManager.fetchAll()
        setupDataSource()
    }
                
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchBar.text == nil {
            inSearchMode = false
            setupDataSource()
            view.endEditing(true)
        } else {
            inSearchMode = true
            filteredFavorite = favoriteList.filter({ $0.name?.range(of: searchText) != nil })
            setupDataSource()
        }
    }
    
}
