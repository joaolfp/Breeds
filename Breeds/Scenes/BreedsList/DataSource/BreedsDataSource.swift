import UIKit

final class BreedsDataSource: NSObject, UICollectionViewDataSource {
    
    private let breedsCollections: UICollectionView
    private var breedsList: [BreedsDTO]
    
    init(breedsCollections: UICollectionView, breedsList: [BreedsDTO]) {
        self.breedsCollections = breedsCollections
        self.breedsList = breedsList
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breedsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = breedsCollections.addCell(for: indexPath, cellType: BreedsViewCell.self)
        
        cell.photo.download(image: breedsList[indexPath.row].image.url)
        
        return cell
    }
}

extension BreedsDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40) / 2
        return CGSize(width: width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
