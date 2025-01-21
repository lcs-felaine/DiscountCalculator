//
//  ContentView.swift
//  DiscountCalculator
//
//  Created by Fang Elaine on 2025/1/20.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var originalPrice = ""
    
    @State var discountPercentage : Double = 1.0
    
    @State var feedback = ""
    
    var discountedPrice: Double{
        return originalPrice - (originalPrice * discountPercentage / 100)
    }
    
    var moneySaved: Double{
        return originalPrice * discountPercentage / 100
    }
    
    
    var body: some View {
        
        NavigationStack{
            VStack() {
                
                Text("Did you save money today? ")
                    .font(.headline)
                
                TextField("Enter the food prices here.", text: $originalPrice)
                
                Slider(
                    value: $discountPercentage,
                    in: 1...100)
                
                HStack{
                    Button {
                        prices()
                    } label: {
                        Text("Determine Price")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                    reset()
                    } label: {
                        Text("reset")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
            .navigationTitle("Discount Calculator")
        }
    }
        
        func prices(){
            
            guard let prices = Double(originalPrice) else {
                feedback = "Please provide an number."
                return
                
            }
        
            func reset(){
                
            originalPrice = ""
            discountPercentage : Double = 1.0
            feedback = ""
                
            }
        }
        
    }

#Preview {
    CalculatorView()
}
