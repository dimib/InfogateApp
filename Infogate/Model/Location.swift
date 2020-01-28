//
//  Location.swift
//  Infogate
//
//  Created by Brukakis, Dimitrios (DE) on 28.01.20.
//  Copyright © 2020 Brukakis, Dimitrios (DE). All rights reserved.
//

import Foundation

struct Location {
    var id: String
    var name: String
    var city: String
    var position: Position
    var departures: [Departure]?
}

struct Position {
    var latitude: Double
    var longitude: Double
}

struct Departure {
    var name: String
    var direction: String
    var departure: Int
}

let UNKNOWN_LOCATION = Location(id: "", name: "", city: "", position: Position(latitude: 0.0, longitude: 0.0))
