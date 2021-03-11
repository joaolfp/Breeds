import UIKit

final class DetailsView: UIView {
    
    var didPressButton: ((UIButton) -> ())?
    
    private let scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
            
    private let contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let photo: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return imageView
    }()
    
    let descriptionPet: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.accessibilityIdentifier = "description-text"
        return label
    }()
    
    let lifeSpan: UILabel = {
        var label = PaddingLabel(top: 8, bottom: 8, left: 8, right: 8)
        label.textColor = .white
        label.backgroundColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    let weight: UILabel = {
        var label = PaddingLabel(top: 8, bottom: 8, left: 8, right: 8)
        label.textColor = .white
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    let height: UILabel = {
        var label = PaddingLabel(top: 8, bottom: 8, left: 8, right: 8)
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    let favorite: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle(L10n.addFavorites, for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(DetailsView.pressedFavorite), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.accessibilityIdentifier = "button-favorite"
        return button
    }()

    private let stackContentView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    func addItems(breedsItems: BreedsDTO) {
        photo.download(image: breedsItems.image.url)
        descriptionPet.text = breedsItems.description ?? L10n.notDescription
        lifeSpan.text = "\(L10n.lifeSpan) \(breedsItems.life_span)"
        weight.text = "\(L10n.weight) \(breedsItems.weight.metric) / \(breedsItems.weight.imperial)"
        height.text = "\(L10n.height) \(breedsItems.height.metric) / \(breedsItems.height.imperial)"
    }
    
    @objc
    func pressedFavorite(sender: UIButton) {
        didPressButton?(favorite)
    }

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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackContentView)
        
        stackContentView.addArrangedSubview(photo)
        stackContentView.addArrangedSubview(favorite)
        stackContentView.addArrangedSubview(descriptionPet)
        stackContentView.addArrangedSubview(lifeSpan)
        stackContentView.addArrangedSubview(weight)
        stackContentView.addArrangedSubview(height)
    }
    
    func setupConstraints() {
        scrollView.topAnchor(equalTo: topAnchor)
        scrollView.leadingAnchor(equalTo: leadingAnchor)
        scrollView.trailingAnchor(equalTo: trailingAnchor)
        scrollView.bottomAnchor(equalTo: bottomAnchor)
        scrollView.widthAnchor(equalTo: widthAnchor)
            
        contentView.topAnchor(equalTo: scrollView.topAnchor, constant: 16)
        contentView.leadingAnchor(equalTo: scrollView.leadingAnchor)
        contentView.trailingAnchor(equalTo: scrollView.trailingAnchor)
        contentView.bottomAnchor(equalTo: scrollView.bottomAnchor, constant: -16)
        contentView.widthAnchor(equalTo: scrollView.widthAnchor)
            
        stackContentView.topAnchor(equalTo: contentView.topAnchor)
        stackContentView.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
        stackContentView.trailingAnchor(equalTo: contentView.trailingAnchor, constant: -16)
        stackContentView.heightAnchor(equalTo: contentView.heightAnchor)
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}

// MARK: - Status favorites button
extension DetailsView {
    func buttonRemoveFavorite() {
        favorite.setTitle(L10n.removeFavorites, for: .normal)
        favorite.setTitleColor(.white, for: .normal)
        favorite.backgroundColor = .red
    }
    
    func buttonAddFavorite() {
        favorite.setTitle(L10n.addFavorites, for: .normal)
        favorite.setTitleColor(.red, for: .normal)
        favorite.backgroundColor = .white
    }
}
