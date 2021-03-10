import UIKit

final class SignupViewController: UIViewController {
    
    private let signupView = SignupView()
    
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
            loginConnect()
        }
    }
    
    private func loginConnect() {
        
    }
}
