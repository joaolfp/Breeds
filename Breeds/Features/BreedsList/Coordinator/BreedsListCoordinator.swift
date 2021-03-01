import UIKit

protocol BreedsListDelegate: class {
    func didSelectedBreed(_ selectedBreed: BreedsDTO)
}

class BreedsListCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    unowned var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let breedsListViewController = BreedsListViewController()
        breedsListViewController.tabBarItem = UITabBarItem(title: L10n.breedsName, image: UIImage(systemName: L10n.iconList), tag: 0)
        breedsListViewController.title = L10n.breedsName
        breedsListViewController.coordinator = self
        show(breedsListViewController, with: .push)
    }
}

extension BreedsListCoordinator: BreedsListDelegate {
    func didSelectedBreed(_ selectedBreed: BreedsDTO) {
        let detailsViewController = DetailsViewController(breedsItems: selectedBreed)
        show(detailsViewController, with: .push)
    }
}
