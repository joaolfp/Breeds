import UIKit

final class BreedsViewCell: UICollectionViewCell, Identifiable {
    
    let photo: UIImageView = {
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
    
    func breedsCell(with breeds: BreedsDTO) {
        photo.download(image: breeds.image.url)
    }
}

extension BreedsViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(photo)
    }
    
    func setupConstraints() {
        photo.topAnchor(equalTo: contentView.topAnchor)
        photo.leadingAnchor(equalTo: contentView.leadingAnchor)
        photo.trailingAnchor(equalTo: contentView.trailingAnchor)
        photo.bottomAnchor(equalTo: contentView.bottomAnchor)
    }
}
