//
//  GoButton.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/7/22.
//

import SwiftUI

struct GoButton: View {
    @Binding var showReset: Bool
    @Binding var showGo: Bool
    @Binding var defaultFlowers: Bool
    @Binding var moneyRemaining: Int
    @Binding var randomFlowers: Array<Int>
    @Binding var spinAmount: Double
    @Binding var goDisabled: Bool
    
    var body: some View {
        Button(action: {
            if showReset == false {
                showReset.toggle()
            }
            if defaultFlowers {
                defaultFlowers.toggle()
            }
            withAnimation(.linear(duration: 0.5)) {
                spinAmount = 360.0
            }
            randomFlowers = getRandomValues()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                moneyRemaining -= Constants.COST_PER_ROLL
                moneyRemaining += checkMatchingFlowers(flowerIndexList: randomFlowers)
                
                if moneyRemaining == Constants.YOUR_BROKE {
                    showGo.toggle()
                }
                goDisabled.toggle()
            }
            goDisabled.toggle()
        }) {
            Image("go")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
        .disabled(goDisabled)
    }
}
