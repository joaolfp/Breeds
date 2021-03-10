import UIKit

protocol SignupDelegate: AnyObject {
    func showTabBarController()
}

final class SignupCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signupViewController = SignupViewController()
        signupViewController.coordinator = self
        show(signupViewController, with: .push)
    }
}

extension SignupCoordinator: SignupDelegate {
    func showTabBarController() {
        let tabBarViewController = TabBarViewController()
        tabBarViewController.modalPresentationStyle = .fullScreen
        show(tabBarViewController, with: .present(nil))
    }
}
