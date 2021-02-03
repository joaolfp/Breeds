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
        breedsListViewController.tabBarItem = UITabBarItem(title: L10n.breedsName, image: UIImage(systemName: L10n.iconList), tag: 0)
        breedsListViewController.title = L10n.breedsName
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