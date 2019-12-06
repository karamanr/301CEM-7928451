//
//  TableViewCell.swift
//  WeatherApplication
//
//  Created by Ridvan Karaman on 04/12/2019.
//  Copyright © 2019 Ridvan Karaman. All rights reserved.
//

import Foundation
import UIKit
class TableViewCell:UITableViewCell {
    
// MARK: Outlets set up
    @IBOutlet weak var cityL: UILabel!
    @IBOutlet weak var timeL: UILabel!
    @IBOutlet weak var min_tempL: UILabel!
    @IBOutlet weak var tempL: UILabel!
    @IBOutlet weak var max_tempL: UILabel!
    
    override var reuseIdentifier: String? {
        return "TableViewCell"
    }
}
