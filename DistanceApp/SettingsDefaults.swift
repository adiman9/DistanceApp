//
//  SettingsDefaults.swift
//  DistanceApp
//
//  Created by Adrian Henry on 14/04/2020.
//  Copyright © 2020 Hungry Turtle Code. All rights reserved.
//

import Foundation

@propertyWrapper
struct  SettingsDefault<T> {
    let key: String
    let defaultValue: T
    
    init (_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
