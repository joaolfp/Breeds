import UIKit

final class FavoritesCoordinator: Coordinator {
    var currentViewController: UIViewController?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
        favoritesViewController.title = "Favorites"
        show(favoritesViewController, with: navigationType)
        return navigationController
    }
}
