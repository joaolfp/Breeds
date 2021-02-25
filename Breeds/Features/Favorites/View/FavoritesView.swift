import UIKit

final class FavoritesView: UIView {
    
    lazy var favoritesTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCell(cellType: FavoritesViewCell.self)
        return tableView
    }()
    
    func searchBarLayout(searchBar: UISearchBar) {
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        searchBar.tintColor = .black
        searchBar.barTintColor = .black
        searchBar.placeholder = "Search for cards"
        searchBar.searchTextField.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesView: ViewCode {
    func buildViewHierarchy() {
        addSubview(favoritesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
