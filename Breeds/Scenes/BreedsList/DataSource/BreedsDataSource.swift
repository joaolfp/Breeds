import UIKit

final class BreedsDataSource: NSObject, UICollectionViewDataSource {
    
    let breedsCollections: UICollectionView
    
    init(breedsCollections: UICollectionView) {
        self.breedsCollections = breedsCollections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = breedsCollections.addCell(for: indexPath, cellType: BreedsViewCell.self)
        
        cell.photo.download(image: "https://cdn2.thedogapi.com/images/sqQJDtbpY.jpg")
        
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
