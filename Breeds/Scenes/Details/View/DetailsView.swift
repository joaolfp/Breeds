import UIKit

class DetailsView: UIView {
    
    lazy var photo: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

extension DetailsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(photo)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor),
            photo.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
