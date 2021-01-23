import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCode {

    func setupBaseView() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    func configureViews() {
    }
}
