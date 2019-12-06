//
//  ViewController.swift
//  WA
//
//  Created by Ridvan Karaman on 04/12/2019.
//  Copyright © 2019 Ridvan Karaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource{
    
    var timer = Timer()
    fileprivate var contentView:MainView {
        return self.view as! MainView
    }
    var data_Ready:Bool = false
    var offerModel:OfferModel!{
        didSet {
            DispatchQueue.main.async {
                self.contentView.tableView.reloadData()
            }
            
        }
    }
    
//    override func loadView() {
//        super.loadView()
//        self.view = MainView()
//
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        (self.view as! MainView).tableView.dataSource = self
        
    }

    fileprivate func setupNavBar(){
        self.navigationItem.title = "Weather Application"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func updateSearchResults(for searchController: UISearchController){
        let city = searchController.searchBar.text!
        timer.invalidate()
        if city.count > 1 {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (Timer) in
                NetworkManager.shared.getWeather(city: city, result: { (model) in
                    if model != nil {
                        self.data_Ready = true
                        self.offerModel = model
                    }
                    
                })
            })
        }
    }
    public func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if data_Ready {
            return self.offerModel!.list!.count
        } else {
            return 0
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.cityL.text = self.offerModel.city!.name
        cell.timeL.text = self.offerModel.list![indexPath.row].dt_txt
        cell.min_tempL.text = self.offerModel.list![indexPath.row].main!.temp_min?.description
        cell.tempL.text = self.offerModel.list![indexPath.row].main!.temp?.description
        cell.max_tempL.text = self.offerModel.list![indexPath.row].main!.temp_max?.description
        return cell
    }

    
}
