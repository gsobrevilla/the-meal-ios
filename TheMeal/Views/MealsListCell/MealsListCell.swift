//
//  MealsListCell.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

class MealsListCell: UITableViewCell {
    
    @IBOutlet private var thumbImageView: UIImageView?
    @IBOutlet private var nameLabel: UILabel?
    @IBOutlet private var categoryLabel: UILabel?
    
    var viewModel: MealsListItemViewModel? {
        didSet {
            updateUIFromViewModel()
        }
    }
    
    private func updateUIFromViewModel() {
        thumbImageView?.loadFrom(url: viewModel?.pictureUrl)
        nameLabel?.text = viewModel?.name
        categoryLabel?.text = viewModel?.category
    }
}
