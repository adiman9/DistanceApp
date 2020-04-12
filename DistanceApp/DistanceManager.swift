//
//  DistanceManager.swift
//  DistanceApp
//
//  Created by Adrian Henry on 11/04/2020.
//  Copyright © 2020 Hungry Turtle Code. All rights reserved.
//

import Foundation
import CoreLocation

class DistanceManager: NSObject, ObservableObject {
    @Published var distance: Double? = 0
    
    func distance(_ locations: [CLLocation]) {
        if let locationA = locations.first, let locationB = locations.last {
            self.distance = Double(locationA.distance(from: locationB) / 1000)
        }
    }
}

extension CLLocation {
    var latitude: Double {
        return self.coordinate.latitude
    }
    var longitude: Double {
        return self.coordinate.longitude
    }
}
