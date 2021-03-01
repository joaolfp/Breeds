import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let breedsCoordinator = BreedsListCoordinator(navigationController: navigationController())
        breedsCoordinator.start()
        
        let favoritesCoordinator = FavoritesCoordinator(navigationController: navigationController())
        favoritesCoordinator.start()

        viewControllers = [breedsCoordinator.navigationController, favoritesCoordinator.navigationController]
        
        tabBar.barTintColor = .yellow
        tabBar.tintColor = .black
    }

    private func navigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        navigationController.navigationBar.barTintColor = .yellow
        navigationController.navigationBar.tintColor = .black
        
        let app = UINavigationBarAppearance()
        app.backgroundColor = .yellow
        navigationController.navigationBar.scrollEdgeAppearance = app
        return navigationController
    }

}
