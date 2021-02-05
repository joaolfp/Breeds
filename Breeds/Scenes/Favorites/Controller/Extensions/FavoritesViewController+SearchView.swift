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
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        searchBar.tintColor = .black
        searchBar.barTintColor = .black
        searchBar.placeholder = "Search for cards"
        searchBar.searchTextField.textColor = .black
                        
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        setupSearchBar()
        inSearchMode = false
        favoritesView.favoritesTableView.reloadData()
        setupDataSource()
    }
                
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchBar.text == nil {
            inSearchMode = false
            favoritesView.favoritesTableView.reloadData()
            setupDataSource()
            view.endEditing(true)
        } else {
            inSearchMode = true
            filteredFavorite = favoriteList.filter({ $0.name?.range(of: searchText) != nil })
            setupDataSource()
        }
    }
    
}
