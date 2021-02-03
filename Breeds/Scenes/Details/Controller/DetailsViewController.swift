import UIKit

final class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    var breedsItems: BreedsDTO
    var databaseManager = DatabaseManager()
    
    init(breedsItems: BreedsDTO) {
        self.breedsItems = breedsItems
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        title = breedsItems.name
    }
    
    private func setupBreedsItems() {
        detailsView.addItems(breedsItems: breedsItems)
    }
}
