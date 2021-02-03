import UIKit

extension DetailsViewController {
    
    func setupFavoriteTap() {
        detailsView.didPressButton = { [weak self] button in
            self?.pressedFavorite(sender: button)
        }
    }
    
    func setupStatusFavorites() {
        databaseManager.getById(detailsView: detailsView, breedsItems: breedsItems)
    }
    
    private func pressedFavorite(sender: UIButton) {
        if detailsView.favorite.backgroundColor == UIColor.white {
            detailsView.buttonRemoveFavorite()
            addToFavorite()
        } else {
            detailsView.buttonAddFavorite()
            removeToFavorite()
        }
    }
    
    private func addToFavorite() {
        databaseManager.createBreeds(id: breedsItems.id, name: breedsItems.name, photo: breedsItems.image.url)
    }
    
    private func removeToFavorite() {
        databaseManager.deleteBreed(id: breedsItems.id)
    }
}
