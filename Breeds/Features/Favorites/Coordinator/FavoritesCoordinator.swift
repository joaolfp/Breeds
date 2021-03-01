import UIKit

final class FavoritesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: L10n.favoritesName, image: UIImage(systemName: L10n.iconFavorite), tag: 1)
        favoritesViewController.title = L10n.favoritesName
        show(favoritesViewController, with: .push)
    }
}
