import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(cellType: T.Type) where T: Identifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func addCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }
}
