import UIKit

final class BreedsListCoordinator: Coordinator {
    var currentViewController: UIViewController?
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let breedsListViewController = BreedsListViewController()
        breedsListViewController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.dash"), tag: 0)
        breedsListViewController.title = "Breeds"
        show(breedsListViewController, with: navigationType)
        return navigationController
    }
}
