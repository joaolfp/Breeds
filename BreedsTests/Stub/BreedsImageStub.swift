import Foundation
@testable import Breeds

extension BreedsImage {
    static func stub(url: String) -> BreedsImage {
        return BreedsImage(url: url)
    }
}
