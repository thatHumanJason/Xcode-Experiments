//
//  ColorGuessingGame.swift
//  Xcode Experiments
//
//  Created by Jason Brain on 10/8/19.
//  Copyright © 2019 Jason Brain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var r: Double
    @State var g: Double
    @State var b: Double
    @State var showAlert = false
    
    func decToHex(value: Double) -> String {
        return String(format:"%02X", Int(value * 255.0))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        ZStack {
                            // Color preview border
                            Rectangle()
                                .foregroundColor(Color("Border"))
                                .frame(width: 150, height: 150)
                                .cornerRadius(32)
                                .shadow(radius: 1)
                            
                            // Color Preview
                            Rectangle()
                                .foregroundColor(Color(red: r, green: g, blue: b, opacity: 1.0))
                                .frame(width: 134, height: 134)
                                .cornerRadius(24)
                        }
                        VStack(alignment: .leading) {
                            // RGB Value of the color
                            Text("RGB: \(Int(r * 255.0)), \(Int(g * 255.0)), \(Int(b * 255.0))")
                            
                            // Hex Value of the color
                            Text("Hex: #\(decToHex(value: r))\(decToHex(value: g))\(decToHex(value: b))")
                        }.padding()
                    }
                }
                ColorSlider(value: $r, textColor: .red)
                ColorSlider(value: $g, textColor: .green)
                ColorSlider(value: $b, textColor: .blue)
            }
            .navigationBarTitle(Text("Color Preview"))
            .navigationBarItems(trailing: Button(action: {
                self.r = Double.random(in: 0..<1)
                self.g = Double.random(in: 0..<1)
                self.b = Double.random(in: 0..<1)
            }) {
                Text("Randomize")
            })
        }
    }
}

struct ColorGuessingGame_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(r: 0.5, g: 0.5, b: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
                .accentColor(textColor)
            Text("255")
                .foregroundColor(textColor)
        }.padding()
    }
}
