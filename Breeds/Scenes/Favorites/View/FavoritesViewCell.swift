import UIKit

final class FavoritesViewCell: UITableViewCell, Identifiable {
    
    lazy var photo: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var name: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBaseView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesViewCell: ViewCode {
    func buildViewHierarchy() {
        addSubview(photo)
        addSubview(name)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor),
            photo.widthAnchor.constraint(equalToConstant: 100),
            
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 8),
            name.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureViews() {
        accessoryType = .disclosureIndicator
    }
}
