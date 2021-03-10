import UIKit

final class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .red
    }
}
