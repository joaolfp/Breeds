import UIKit

final class SignupViewController: UIViewController {
    
    private let signupView = SignupView()
    private let service = SignupService()
    var coordinator: SignupDelegate?
    
    override func loadView() {
        view = signupView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        signupView.delegate = self
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}

extension SignupViewController: SignupViewDelegate {
    func signupTap() {
        validationField()
    }
    
    private func validationField() {
        guard let email = signupView.emailField.text else { return }
        
        if email.isEmpty {
            signupView.emptyMessage.isHidden = false
        } else {
            signupView.emptyMessage.isHidden = true
            loginConnect(email: email)
        }
    }
    
    private func loginConnect(email: String) {
        service.signup(email: email) { [weak self] result in
            switch result {
            case .success(let signup):
                print(signup.user.token)
                self?.coordinator?.showTabBarController()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
