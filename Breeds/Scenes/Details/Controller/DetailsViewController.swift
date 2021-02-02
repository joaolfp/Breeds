import UIKit

final class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    var breedsItems: BreedsDTO?
    var databaseManager = DatabaseManager()
    
    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupBreedsItems()
        setupFavoriteTap()
        setupStatusFavorites()
    }
    
    private func setupNavigationController() {
        title = breedsItems?.name
    }
    
    private func setupBreedsItems() {
        detailsView.addItems(breedsItems: breedsItems)
    }
}
