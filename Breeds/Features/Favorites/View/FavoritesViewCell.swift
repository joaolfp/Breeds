import UIKit

final class FavoritesViewCell: UITableViewCell, Identifiable {
    
    let photo: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let name: UILabel = {
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
    
    func favoritesCell(with favorites: BreedEntity) {
        photo.download(image: favorites.photo ?? "" )
        name.text = favorites.name
    }
}

extension FavoritesViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(photo)
        contentView.addSubview(name)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.widthAnchor.constraint(equalToConstant: 100),
            
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 8),
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configureViews() {
        accessoryType = .disclosureIndicator
    }
}
