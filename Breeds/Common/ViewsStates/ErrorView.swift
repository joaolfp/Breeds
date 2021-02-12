import UIKit

final class ErrorView: UIView {
    
    static let instance = ErrorView()
    
    private lazy var iconError: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Asset.error.image
        return imageView
    }()
    
    private lazy var message: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = L10n.messageError
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ErrorView: ViewCode {
    func buildViewHierarchy() {
        addSubview(iconError)
        addSubview(message)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconError.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconError.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconError.widthAnchor.constraint(equalToConstant: 200),
            iconError.heightAnchor.constraint(equalToConstant: 200),
            
            message.topAnchor.constraint(equalTo: iconError.bottomAnchor, constant: 16),
            message.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureViews() {
        backgroundColor = .black
    }
}
