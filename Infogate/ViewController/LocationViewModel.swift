//
//  LocationViewModel.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 28.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationViewModel: NSObject {
    
    var locations = [Location]()
    
    var count: Int {
        get {
            return locations.count
        }
    }
    func location(atIndex: Int) -> Location {
        return locations[atIndex]
    }
}

class LocationResultCellViewModel {
    
    var location: Location!
    
    var name: String {
        return location.name
    }
    var city: String {
        return location.city
    }
    
    init(_ location: Location) {
        self.location = location
    }
}

class LocationDetailViewModel {
    var location: Location!
    
    var name: String {
        return location.name
    }
    var city: String {
        return location.city
    }
    
    var position: CLLocation {
        return .init(latitude: location.position.longitude, longitude: location.position.longitude)
    }
    
    var departures: [Departure]? {
        return location.departures
    }
    
    init(_ location: Location) {
        self.location = location
    }
}

class DepartureModel {
    var departure: Departure!
    
    init(_ departure: Departure) {
        self .departure = departure
    }
    
    var name: String {
        departure.name
    }
    var direction: String {
        departure.direction
    }
    
    var departureIn: Int {
        departure.departure
    }
}
