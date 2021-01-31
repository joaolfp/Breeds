import UIKit

extension DetailsViewController {
    
    func setupFavoriteTap() {
        detailsView.didPressButton = { [weak self ] button in
            self?.pressedFavorite(sender: button)
        }
    }
    
    public func pressedFavorite(sender: UIButton) {
        if detailsView.favorite.backgroundColor == UIColor.white {
            detailsView.favorite.setTitle(Identifier.String.removeFavorites, for: .normal)
            detailsView.favorite.setTitleColor(.white, for: .normal)
            detailsView.favorite.backgroundColor = .red
            print("Add to favorites")
        } else {
            detailsView.favorite.setTitle(Identifier.String.addFavorites, for: .normal)
            detailsView.favorite.setTitleColor(.red, for: .normal)
            detailsView.favorite.backgroundColor = .white
            print("Remove to favorites")
        }
    }
}
