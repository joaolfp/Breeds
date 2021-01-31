import UIKit

class DetailsView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
            
    private lazy var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var photo: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return imageView
    }()
    
    lazy var descriptionPet: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    lazy var lifeSpan: UILabel = {
        var label = PaddingLabel(top: 8, bottom: 8, left: 8, right: 8)
        label.textColor = .white
        label.backgroundColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    lazy var weight: UILabel = {
        var label = PaddingLabel(top: 8, bottom: 8, left: 8, right: 8)
        label.textColor = .white
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    lazy var height: UILabel = {
        var label = PaddingLabel(top: 8, bottom: 8, left: 8, right: 8)
        label.textColor = .white
        label.backgroundColor = .systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var stackContentView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    func addItems(breedsItems: BreedsDTO?) {
        photo.download(image: breedsItems?.image.url ?? "")
        descriptionPet.text = breedsItems?.description ?? Identifier.String.notDescription
        lifeSpan.text = "\(Identifier.String.lifeSpan) \(breedsItems?.life_span ?? "")"
        weight.text = "\(Identifier.String.weight) \(breedsItems?.weight.metric ?? "") / \(breedsItems?.weight.imperial ?? "")"
        height.text = "\(Identifier.String.height) \(breedsItems?.height.metric ?? "") / \(breedsItems?.height.imperial ?? "")"
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
        stackContentView.addArrangedSubview(descriptionPet)
        stackContentView.addArrangedSubview(lifeSpan)
        stackContentView.addArrangedSubview(weight)
        stackContentView.addArrangedSubview(height)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stackContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackContentView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -16)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
