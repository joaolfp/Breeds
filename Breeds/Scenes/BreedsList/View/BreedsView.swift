import UIKit

class BreedsView: UIView {
    
    lazy var breedsCollections: UICollectionView = {
        var flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
            
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .black
        collection.registerCell(cellType: BreedsViewCell.self)
        return collection
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

extension BreedsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(breedsCollections)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            breedsCollections.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            breedsCollections.leadingAnchor.constraint(equalTo: leadingAnchor),
            breedsCollections.trailingAnchor.constraint(equalTo: trailingAnchor),
            breedsCollections.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
