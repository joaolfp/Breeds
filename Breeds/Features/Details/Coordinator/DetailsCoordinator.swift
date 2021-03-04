import UIKit

final class DetailsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private var breedsDTO: BreedsDTO
    
    init(navigationController: UINavigationController, breedsDTO: BreedsDTO) {
        self.navigationController = navigationController
        self.breedsDTO = breedsDTO
    }
    
    func start() {
        let detailsViewController = DetailsViewController(breedsItems: breedsDTO)
        show(detailsViewController, with: .push)
    }
}
