//
//  ContentView.swift
//  DiscountCalculator
//
//  Created by Fang Elaine on 2025/1/20.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var originalPrice = ""
    
    @State var discountedPrice : Double = 1.0
    
    @State var discountPercentage : Double = 1.0
    
    @State var moneySaved : Double  = 1.0
    
    @State var feedback = ""
    

    var body: some View {
        
        NavigationStack{
            
            VStack() {
                
                Text("Did you save money today? ")
                    .font(.headline)
                
                Spacer()
                
                // Textfield and Slider
                
                TextField("Enter the food prices here.", text: $originalPrice)
                Spacer()
                    
                    VStack{
                        Text("Discount  number:\(discountPercentage.formatted(.number.precision(.fractionLength(1))))")
                        
                        Slider(
                            value: $discountPercentage,
                            in: 1...100)
                    }
                Spacer()
                
                
               //Feedback
                
                Text(feedback)

                            
                //Button
                
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
                    .tint(.red)
                }
                Spacer()
               
                //Output
                
                Text("The final price is \(discountedPrice.formatted(.number.precision(.fractionLength(2))))!");
                
                Text("You saved \(moneySaved.formatted(.number.precision(.fractionLength(2)))) today!")
                
                Spacer()
                
                    .navigationTitle("Discount Calculator")
            }
        }
    }
    
        func calculatedPrices(){
            
            guard let prices = Double(originalPrice),prices > 0 else {
                feedback = "Please provide a positive number."
                return
            }
            
            discountedPrice = prices - (prices * discountPercentage / 100)
    
            moneySaved = prices * discountPercentage / 100
        }
        
        func reset(){
            
            originalPrice = ""
            feedback = ""
            
        }
}

#Preview {
    CalculatorView()
}
