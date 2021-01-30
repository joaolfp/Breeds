import UIKit

protocol BreedsListDelegate: AnyObject {
    func didSelectedBreed(_ selectedBreed: BreedsDTO)
}

final class BreedsListCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @discardableResult
    func start() -> UIViewController {
        let breedsListViewController = BreedsListViewController()
        breedsListViewController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.dash"), tag: 0)
        breedsListViewController.title = "Breeds"
        breedsListViewController.coordinator = self
        navigationController.pushViewController(breedsListViewController, animated: true)
        return navigationController
    }
}

extension BreedsListCoordinator: BreedsListDelegate {
    func didSelectedBreed(_ selectedBreed: BreedsDTO) {
        let detailsViewController = DetailsViewController()
        detailsViewController.breedsItems = selectedBreed
        navigationController.pushViewController(detailsViewController, animated: true)
    }
}
