import UIKit

final class SignupCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signupViewController = SignupViewController()
        show(signupViewController, with: .push)
    }
}
