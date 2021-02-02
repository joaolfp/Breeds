import UIKit

extension DetailsViewController {
    
    func setupFavoriteTap() {
        detailsView.didPressButton = { [weak self] button in
            self?.pressedFavorite(sender: button)
        }
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
        guard let id = breedsItems?.id else { return }
        guard let name = breedsItems?.name else { return }
        guard let photo = breedsItems?.image.url else { return }
        
        databaseManager.createBreeds(id: id, name: name, photo: photo)
    }
    
    private func removeToFavorite() {
        guard let id = breedsItems?.id else { return }
        databaseManager.deleteBreed(id: id)
    }
    
    func setupStatusFavorites() {
        databaseManager.getById(detailsView: detailsView, breedsItems: breedsItems)
    }
    
}
