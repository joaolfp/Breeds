import UIKit

extension UICollectionView {

    func registerCell<T: UICollectionViewCell>(cellType: T.Type) where T: Identifiable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func addCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Identifiable {
        let getCell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath)
        guard let cell = getCell as? T else {
            fatalError(
                "Failed cell with identifier \(cellType.reuseIdentifier)"
            )
        }
        return cell
    }
}
