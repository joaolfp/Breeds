import UIKit

protocol Identifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Identifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
