//
//  LocationAnnotation.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 28.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import Foundation
import MapKit

class LocationAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(_ location: Location) {
        coordinate = CLLocationCoordinate2D(latitude: location.position.latitude, longitude: location.position.longitude)
    }
}
