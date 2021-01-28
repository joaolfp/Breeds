//
//  DetailsViewController.swift
//  Breeds
//
//  Created by joao.lucas.f.pereira on 28/01/21.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    var breedsItems: BreedsDTO?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        print(breedsItems?.name ?? "")
    }
}
