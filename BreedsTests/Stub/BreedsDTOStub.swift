import Foundation
@testable import Breeds

extension BreedsDTO {
    
    static func stub(id: Int = 0,
                     name: String,
                     temperament: String,
                     description: String,
                     life_span: String,
                     image: BreedsImage,
                     weight: BreedsWeight,
                     height: BreedsHeight) -> BreedsDTO {
        
        return BreedsDTO(id: id,
                         name: name,
                         temperament: temperament,
                         description: description,
                         life_span: life_span,
                         image: image,
                         weight: weight,
                         height: height)
    }
}
