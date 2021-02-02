import Foundation
@testable import Breeds

extension BreedsWeight {
    static func stub(metric: String, imperial: String) -> BreedsWeight {
        return BreedsWeight(metric: metric, imperial: imperial)
    }
}
