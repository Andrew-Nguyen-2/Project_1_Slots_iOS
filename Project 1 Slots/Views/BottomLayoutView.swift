//
//  BottomLayoutView.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/7/22.
//

import SwiftUI

struct BottomLayout: View {
    @Binding var showReset: Bool
    @Binding var showGo: Bool
    @Binding var defaultFlowers: Bool
    @Binding var moneyRemaining: Int
    
    var body: some View {
        HStack {
            GoldCoin()
            MoneyTextView(money: moneyRemaining)
            
            if showReset {
                ResetButton(showReset: $showReset, showGo: $showGo,
                            defaultFlowers: $defaultFlowers, moneyRemaining: $moneyRemaining)
            }
        }
        .padding(.bottom, 50)
    }
}

struct GoldCoin: View {
    var body: some View {
        Image("dol")
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
    }
}

struct MoneyTextView: View {
    var money: Int
    var body: some View {
        Text("$ \(money)")
            .font(.system(size: 40))
            .foregroundColor(Color.init("Money Color"))
            .padding(.trailing, 130)
    }
}

struct ResetButton: View {
    @Binding var showReset: Bool
    @Binding var showGo: Bool
    @Binding var defaultFlowers: Bool
    @Binding var moneyRemaining: Int
    
    var body: some View {
        Button(action: {
            showReset.toggle()
            defaultFlowers.toggle()
            moneyRemaining = Constants.STARTUP_CASH
            if showGo == false {
                showGo.toggle()
            }
        }) {
            Image("reset1")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
        }
    }
}
