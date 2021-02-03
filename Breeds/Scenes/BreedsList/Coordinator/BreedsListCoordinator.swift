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
        show(breedsListViewController, with: .push)
        return navigationController
    }
}

extension BreedsListCoordinator: BreedsListDelegate {
    func didSelectedBreed(_ selectedBreed: BreedsDTO) {
        let detailsViewController = DetailsViewController(breedsItems: selectedBreed)
        show(detailsViewController, with: .push)
    }
}
