//
//  SettingsView.swift
//  DistanceApp
//
//  Created by Adrian Henry on 14/04/2020.
//  Copyright © 2020 Hungry Turtle Code. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var travelRadius: Double = 300
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.red, .pink]),
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 0, y: 1)))
                    .frame(width: 100, height: 100)
                Image(systemName: "map").foregroundColor(.white).font(.largeTitle)
            }.padding(.top, 150)
            
            Text("Your Ride Experience").font(.largeTitle).bold()
            Spacer().frame(height: 100)
            Text("How far do you like to drive?").bold()
            Slider(value: $travelRadius, in: 100...500, step: 100)
            
            HStack {
                ForEach(0..<Int(travelRadius/100), id:\.self) { _ in
                    Image(systemName: "car").font(.largeTitle)
                }
            }.padding(.top, 10)
            Text("My radius is \(Int(travelRadius)) km")
                .font(.headline).foregroundColor(.gray)
            
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done").bold()
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
