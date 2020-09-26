//
//  UIImageView+LoadFromUrl.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func loadFrom(url urlString: String?) {
        guard let urlStringUnwrapped = urlString, let url = URL(string: urlStringUnwrapped) else {
            self.image = nil
            return
        }
        
        self.kf.setImage(with: url)
    }
}
