import UIKit

final class FavoritesView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FavoritesView: ViewCode {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
}
