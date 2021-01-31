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
        guard let imageUrl = breedsItems?.image.url else { return }
        detailsView.photo.download(image: imageUrl)
        detailsView.descriptionPet.text = breedsItems?.description ?? Identifier.String.notDescription
        detailsView.lifeSpan.text = "\(Identifier.String.lifeSpan) \(breedsItems?.life_span ?? "")"
        detailsView.weight.text = "\(Identifier.String.weight) \(breedsItems?.weight.metric ?? "") / \(breedsItems?.weight.imperial ?? "")"
        detailsView.height.text = "\(Identifier.String.height) \(breedsItems?.height.metric ?? "") / \(breedsItems?.height.imperial ?? "")"
    }
}
