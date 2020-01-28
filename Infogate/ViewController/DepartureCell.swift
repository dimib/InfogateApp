//
//  DepartureCell.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 28.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import UIKit

class DepartureCell: UITableViewCell {

    var viewModel: DepartureModel? {
        didSet {
            name.text = viewModel?.name
            direction.text = viewModel?.direction
            departure.text = "\(viewModel?.departureIn ?? 0)"
        }
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var direction: UILabel!
    @IBOutlet weak var departure: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
