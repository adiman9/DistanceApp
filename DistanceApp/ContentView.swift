//
//  ContentView.swift
//  DistanceApp
//
//  Created by Adrian Henry on 08/04/2020.
//  Copyright © 2020 Hungry Turtle Code. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    
    @ObservedObject var dm = DistanceManager()
    
    var body: some View {
        VStack {
            ZStack {
                MapView(centerCoordinate: $centerCoordinate, mapAnnotations: locations)
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 30, height: 30)
            }
            
            Button(action: {
                let newLocation = MKPointAnnotation()
                newLocation.coordinate = self.centerCoordinate
                self.locations.append(newLocation)
                
                if self.locations.count == 2 {
                    let locationA = CLLocation(latitude: self.locations.first!.coordinate.latitude, longitude: self.locations.last!.coordinate.longitude)
                    let locationB = CLLocation(latitude: self.locations.last!.coordinate.latitude, longitude: self.locations.last!.coordinate.longitude)
                    
                    self.dm.distance([locationA, locationB])
                } else if self.locations.count > 2 {
                    self.dm.distance = 0
                    self.locations.removeAll()
                }
            }, label: {
                Image(systemName: "plus")
            })
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.top, -35)
            
            Text("Distance Evaluation").font(.title).bold()
            Circle().frame(width: 300, height: 300)
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "gear")
                })
            }.padding(.trailing, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
