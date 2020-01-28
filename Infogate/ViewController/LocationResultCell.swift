//
//  LocationResultCell.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 27.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import UIKit

class LocationResultCell: UITableViewCell {

    var viewModel: LocationResultCellViewModel? {
        didSet {
            nameLabel.text = viewModel?.location?.name
            cityLabel.text = viewModel?.location?.city
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
