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
                        calculatedPrices()
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
    
    func calculatedPrices(){
        
        guard let prices = Double(originalPrice),  prices > 0 else {
            feedback = "Please provide an number."
            return
        }
        
        
        var discountedPrice: Double{
            return prices - (prices * discountPercentage / 100)
        }
        
        var moneySaved: Double{
            return prices * discountPercentage / 100
        }
}
        
    
    
    func reset(){
        
        originalPrice = ""
        feedback = ""
        
    }
}



#Preview {
    CalculatorView()
}
