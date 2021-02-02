import Foundation
@testable import Breeds

extension BreedsHeight {
    static func stub(metric: String, imperial: String) -> BreedsHeight {
        return BreedsHeight(metric: metric, imperial: imperial)
    }
}
