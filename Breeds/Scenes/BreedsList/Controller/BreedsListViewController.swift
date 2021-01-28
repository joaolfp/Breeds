import UIKit

final class BreedsListViewController: UIViewController {
    
    private(set) var breedsView = BreedsView()
    private(set) var breedsList = [BreedsDTO]()
    private var activityView: UIActivityIndicatorView?
    private var service = BreedsService()
    var coordinator: BreedsListDelegate?
    
    private(set) var dataSource: BreedsDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            
            dataSource.didSelectBreed = { [weak self] selectedBreed in
                self?.showDetailsForSelectedBreed(selectedBreed)
            }
            
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

        setupFetchBreeds()
    }
    
    private func setupDataSource() {
        dataSource = BreedsDataSource(breedsCollections: breedsView.breedsCollections, breedsList: breedsList)
    }
    
    private func setupFetchBreeds() {
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
    
    // MARK: Selected breed
    func showDetailsForSelectedBreed(_ selectedBreed: BreedsDTO) {
        coordinator?.didSelectedBreed(selectedBreed)
    }
}
