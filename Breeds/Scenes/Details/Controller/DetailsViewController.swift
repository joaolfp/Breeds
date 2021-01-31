import UIKit

final class DetailsViewController: UIViewController {
    
    var detailsView = DetailsView()
    var breedsItems: BreedsDTO?
    
    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupBreedsItems()
        setupFavoriteTap()
    }
    
    private func setupNavigationController() {
        title = breedsItems?.name
    }
    
    private func setupBreedsItems() {
        detailsView.addItems(breedsItems: breedsItems)
    }
}
