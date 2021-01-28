import UIKit

final class TabBarViewController: UITabBarController {
            
    required init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            BreedsListCoordinator(navigationController: navigationController()).start(),
            FavoritesCoordinator(navigationController: navigationController()).start()
        ]
        tabBar.barTintColor = .yellow
        tabBar.tintColor = .black
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
