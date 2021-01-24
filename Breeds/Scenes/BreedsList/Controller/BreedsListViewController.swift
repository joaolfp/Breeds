import UIKit

final class BreedsListViewController: UIViewController {
    
    private let breedsView = BreedsView()
    
    private var dataSource: BreedsDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            
            breedsView.breedsCollections.dataSource = dataSource
            breedsView.breedsCollections.delegate = dataSource
            breedsView.breedsCollections.reloadData()
        }
    }
    
    override func loadView() {
        view = breedsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataSource()
    }
    
    private func setupDataSource() {
        dataSource = BreedsDataSource(breedsCollections: breedsView.breedsCollections)
    }

}
