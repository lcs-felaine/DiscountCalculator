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
    
    @State var discountedPrice = ""
    
    @State var feedback = ""
    
    var body: some View {
        
        NavigationStack{
            VStack() {
                
            
                
                Text("Did you save money today? ")
                
                var discountedPrice: Double {
                    guard let  originalPrice = Double(originalPrice) else {
                        return 0.0
                    }
                    return originalPrice - (originalPrice * discountPercentage / 100)
                }
                
                
            }
            .navigationTitle("Discount Calculator")
        }
        
    }
    
}
    #Preview {
        CalculatorView()
    }

