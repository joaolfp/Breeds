import UIKit

final class BreedsView: UIView {
    
    let pullToRefresh = UIRefreshControl()

    let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .gray
        return view
    }()
    
    let breedsCollections: UICollectionView = {
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
        breedsCollections.addSubview(activityIndicator)
        breedsCollections.refreshControl = pullToRefresh
    }
    
    func setupConstraints() {
        breedsCollections.topAnchor(equalTo: safeAreaLayoutGuide.topAnchor)
        breedsCollections.leadingAnchor(equalTo: leadingAnchor)
        breedsCollections.trailingAnchor(equalTo: trailingAnchor)
        breedsCollections.bottomAnchor(equalTo: bottomAnchor)
            
        activityIndicator.centerXAnchor(equalTo: centerXAnchor)
        activityIndicator.centerYAnchor(equalTo: centerYAnchor)
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
