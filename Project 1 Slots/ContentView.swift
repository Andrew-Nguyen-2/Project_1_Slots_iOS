//
//  ContentView.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var hideReset: Bool = true
    @State var moneyRemaining = 5;
    var body: some View {
        ZStack {
            Image("flowers3")
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Instructions
                Flowers
                GoButton(moneyRemaining: moneyRemaining)
                Spacer()
                HStack {
                    GoldCoin
                    MoneyTextView
                    ResetButton(hidden: hideReset)
                }
                .padding(.bottom, 50)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.init("Background Color"))
    }
}


var Instructions: some View = HStack {
    HStack {
        Text("$1 a Play")
            .font(.system(size: 30))
            .padding(.trailing, 15)
        VStack(alignment: .leading) {
            Text("Match 0 - Lose $1")
                .font(.system(size: 20))
            Text("Match 2 - Win $2")
                .font(.system(size: 20))
            Text("Match 3 - Win $3")
                .font(.system(size: 20))
        }
    }
    .padding(.top, 35)
}

var Flowers: some View = HStack {
    Image("f1")
        .resizable()
        .frame(width: 115, height: 115)
    Image("f2")
        .resizable()
        .frame(width: 115, height: 115)
    Image("f3")
        .resizable()
        .frame(width: 115, height: 115)
}
    .padding(.bottom, 50)

func GoButton(moneyRemaining: Int) -> some View {
    return Button(action: {
        print("go press")
    }) {
        Image("go")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

var GoldCoin: some View = Image("dol")
    .resizable()
    .scaledToFit()
    .frame(width: 80, height: 80)
    .padding(.trailing, 5)

var MoneyTextView: some View = Text("$ 5")
    .font(.system(size: 40))
    .foregroundColor(Color.init("Money Color"))
    .padding(.trailing, 130)

func ResetButton(hidden: Bool) -> some View {
    return Button(action: {
        print("reset press")
    }) {
        Image("reset1")
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .opacity(hidden ? 0 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
