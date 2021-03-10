import UIKit

protocol SignupViewDelegate: AnyObject {
    func signupTap()
}

final class SignupView: UIView {
    
    weak var delegate: SignupViewDelegate?
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = L10n.breedsName
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    let emailField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .none
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: field.frame.height))
        field.leftViewMode = .always
        field.autocapitalizationType = .none
        field.textColor = .black
        field.keyboardAppearance = .dark
        field.keyboardType = .emailAddress
        field.clipsToBounds = true
        field.backgroundColor = UIColor(white: 1, alpha: 0.3)
        field.attributedPlaceholder = NSAttributedString(string: L10n.email, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        return field
    }()
    
    let emptyMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = L10n.emptyMessage
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(L10n.login, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(btnLogin), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func btnLogin() {
        delegate?.signupTap()
    }
}

extension SignupView: ViewCode {
    func buildViewHierarchy() {
        addSubview(title)
        addSubview(emailField)
        addSubview(emptyMessage)
        addSubview(signupButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 45),
            
            emptyMessage.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 4),
            emptyMessage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            signupButton.topAnchor.constraint(equalTo: emptyMessage.bottomAnchor, constant: 8),
            signupButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            signupButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            signupButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureViews() {
        backgroundColor = .systemYellow
    }
}
