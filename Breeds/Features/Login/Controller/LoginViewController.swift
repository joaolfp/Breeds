import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}
