import UIKit

final class BreedsListViewController: UIViewController {
    
    let breedsView = BreedsView()
    var breedsList = [BreedsDTO]()
    private var activityView: UIActivityIndicatorView?
    private var service = BreedsService()
    
    private(set) var dataSource: BreedsDataSource? {
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

        setupLoading()
    }
    
    private func setupDataSource() {
        dataSource = BreedsDataSource(breedsCollections: breedsView.breedsCollections, breedsList: breedsList)
    }
    
    private func setupLoading() {
        breedsView.pullToRefresh.addTarget(self, action: #selector(fetchBreeds(sender:)), for: .valueChanged)
        breedsView.activityIndicator.startAnimating()
        fetchBreeds(sender: breedsView.pullToRefresh)
    }
    
    @objc
    func fetchBreeds(sender: UIRefreshControl) {
        service.getBreadsList { [weak self] result in
            self?.breedsView.pullToRefresh.endRefreshing()
            self?.breedsView.activityIndicator.stopAnimating()
            switch result {
            case .success(let breeds):
                self?.breedsList = breeds
                self?.setupDataSource()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
