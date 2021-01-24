import UIKit
import NVActivityIndicatorView

final class BreedsListViewController: UIViewController {
    
    private let breedsView = BreedsView()
    private(set) var breedsList = [BreedsDTO]()
    private var activityView: UIActivityIndicatorView?
    private var service = BreedsService()
    
    private var dataSource: BreedsDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }
            
            breedsView.breedsCollections.dataSource = dataSource
            breedsView.breedsCollections.delegate = dataSource
            breedsView.breedsCollections.reloadData()
        }
    }
    
    init(service: BreedsService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        BreedsService().getBreadsList { [weak self] result in
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
