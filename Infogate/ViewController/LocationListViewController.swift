//
//  ViewController.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 25.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import UIKit


class LocationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var viewModel = LocationViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchText: UITextField!
 
    @IBAction func onSearch(_ sender: UIView) {
        if let query = searchText.text {
            InfogateClient.instance.queryLocations(query) { (locations, error) in
                let res = locations.map { (location: LocationQuery.Data.Location?) -> Location in
                    guard let l = location else { return UNKNOWN_LOCATION }
                    let lat = l.position!.latitude!
                    let lon = l.position!.longitude!
                    return Location(
                        id: l.id!,
                        name: l.name!,
                        city: l.city!,
                        position: Position(latitude: lat, longitude: lon))
                }
                self.viewModel.locations = res
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationResultCell") as! LocationResultCell
        cell.viewModel = LocationResultCellViewModel(viewModel.location(atIndex: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LocationViewController") as! LocationViewController
        vc.viewModel = LocationDetailViewModel(viewModel.location(atIndex: indexPath.row))
        navigationController?.pushViewController(vc, animated: true)
    }


}

