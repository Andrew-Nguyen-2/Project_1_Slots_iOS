//
//  ContentView.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var showReset = false
    @State var showGo = true
    @State var defaultFlowers = true
    @State var moneyRemaining = Constants.STARTUP_CASH
    @State var randomFlowers = getRandomValues()
    @State var spinAmount = 0.0
    @State var currentFlowers = Constants.FLOWER_IMAGES
    
    var body: some View {
        ZStack {
            
            // Background Image
            Image(Constants.BACKGROUND_IMAGE)
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Instructions()
                
                if defaultFlowers {
                    DefaultFlowers()
                } else {
                    ChangeFlowers(randomFlowers: $randomFlowers, spinAmount: $spinAmount, currentFlowers: $currentFlowers)
                }
                
                if showGo {
                    GoButton(showReset: $showReset, showGo: $showGo, defaultFlowers: $defaultFlowers,
                             moneyRemaining: $moneyRemaining, randomFlowers: $randomFlowers, spinAmount: $spinAmount)
                }

                Spacer()
                
                BottomLayout(showReset: $showReset, showGo: $showGo,
                             defaultFlowers: $defaultFlowers, moneyRemaining: $moneyRemaining)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init("Background Color"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
