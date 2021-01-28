import UIKit

protocol Coordinator: AnyObject {
    var currentViewController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }
    func start() -> UIViewController
}
