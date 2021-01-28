import UIKit

final class DetailsViewController: UIViewController {
    
    var breedsItems: BreedsDTO?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        print(breedsItems?.name ?? "")
    }
}
