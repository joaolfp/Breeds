import UIKit

final class FavoritesViewController: UIViewController {
    
    private(set) var favoritesView = FavoritesView()

    override func loadView() {
        view = favoritesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesView.favoritesTableView.delegate = self
        favoritesView.favoritesTableView.dataSource = self
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesView.favoritesTableView.addCell(for: indexPath, cellType: FavoritesViewCell.self)
        
        cell.name.text = "Bulldog"
        
        return cell
    }
}
