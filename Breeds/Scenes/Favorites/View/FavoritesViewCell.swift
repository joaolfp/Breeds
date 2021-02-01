import UIKit

final class FavoritesViewCell: UITableViewCell, Identifiable {
    
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
        addSubview(name)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            name.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
