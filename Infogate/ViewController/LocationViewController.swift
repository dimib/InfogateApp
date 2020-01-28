//
//  LocationViewController.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 28.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController, UITableViewDataSource {

    var viewModel: LocationDetailViewModel!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var departureTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        
        departureTable.dataSource = self
        
        let annotation = LocationAnnotation(viewModel.location)
        mapView.addAnnotation(annotation)
        mapView.region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000.0, longitudinalMeters: 1000.00)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.departures?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartureCell") as! DepartureCell
        cell.viewModel = DepartureModel((viewModel.departures?[indexPath.row])!)
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
