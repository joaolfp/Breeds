import UIKit

final class FavoritesCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
        favoritesViewController.title = "Favorites"
        navigationController.pushViewController(favoritesViewController, animated: true)
        return navigationController
    }
}
