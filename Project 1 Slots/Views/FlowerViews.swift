//
//  FlowerViews.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/7/22.
//

import SwiftUI

struct DefaultFlowers: View {
    var body: some View {
        HStack {
            ForEach(0..<3) { i in
                Image(Constants.FLOWER_IMAGES[i])
                    .resizable()
                    .frame(width: 115, height: 115)
            }
        }
        .padding(.bottom, 50)
    }
}

struct ChangeFlowers: View {
    @Binding var randomFlowers: Array<Int>
    @Binding var spinAmount: Double
    @Binding var currentFlowers: Array<String>
    
    var body: some View {
        HStack {
            ForEach(0..<3) { i in
                Image(currentFlowers[i])
                    .resizable()
                    .frame(width: 115, height: 115)
                    .rotationEffect(Angle.degrees(spinAmount))
                    .onAnimationRunning(for: spinAmount) {
                        currentFlowers[i] = "tmp"
                    }
                    .onAnimationCompleted(for: spinAmount) {
                        currentFlowers[i] = Constants.FLOWER_IMAGES[randomFlowers[i]]
                        spinAmount = 0.0
                    }
            }
        }
        .padding(.bottom, 50)
    }
}
