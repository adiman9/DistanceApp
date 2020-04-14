//
//  SettingsManager.swift
//  DistanceApp
//
//  Created by Adrian Henry on 14/04/2020.
//  Copyright © 2020 Hungry Turtle Code. All rights reserved.
//

import Foundation
import Combine

class SettingsManager: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @SettingsDefault("travelRadius", defaultValue: 300)
    var travelRadius: Double {
        willSet{
            objectWillChange.send()
        }
    }
}
