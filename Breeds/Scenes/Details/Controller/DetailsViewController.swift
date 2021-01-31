import UIKit

final class DetailsViewController: UIViewController {
    
    private(set) var detailsView = DetailsView()
    var breedsItems: BreedsDTO?
    
    override func loadView() {
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupBreedsItems()
    }
    
    private func setupNavigationController() {
        title = breedsItems?.name
    }
    
    private func setupBreedsItems() {
        detailsView.addItems(breedsItems: breedsItems)
    }
}
