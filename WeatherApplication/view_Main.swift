//
//  view_Main.swift
//  WeatherApplication
//
//  Created by Ridvan Karaman on 04/12/2019.
//  Copyright © 2019 Ridvan Karaman. All rights reserved.
//

import Foundation
import UIKit

class MainView:UIView {
    var tableView = UITableView()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.firstInitialization()
        self.setupConstraints()
    }
    
    fileprivate func firstInitialization() {
        self.addSubview(tableView)
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil),
                                forCellReuseIdentifier: "TableViewCell")
        
    }
    
    fileprivate func setupConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
