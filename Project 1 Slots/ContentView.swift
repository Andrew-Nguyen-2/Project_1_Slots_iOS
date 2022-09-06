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
    @State var isRotated = false
    
    var body: some View {
        ZStack {
            Image("flowers3")
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Instructions()
                
                HStack {
                    if defaultFlowers {
                        DefaultFlowers()
                    } else {
                        ChangeFlowerAnimation(isRotated: $isRotated)
                    }
                }
                .padding(.bottom, 50)
                
                if showGo {
                    GoButton(showReset: $showReset, showGo: $showGo, defaultFlowers: $defaultFlowers,
                             moneyRemaining: $moneyRemaining, randomFlowers: $randomFlowers, isRotated: $isRotated)
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

struct Instructions: View {
    var body: some View {
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
}

struct DefaultFlowers: View {
    var body: some View {
        Image(Constants.FLOWER_1)
            .resizable()
            .frame(width: 115, height: 115)
        Image(Constants.FLOWER_2)
            .resizable()
            .frame(width: 115, height: 115)
        Image(Constants.FLOWER_3)
            .resizable()
            .frame(width: 115, height: 115)
    }
}

struct ChangeFlowerAnimation: View {
    @Binding var isRotated: Bool
    var body: some View {
        Image("tmp")
            .resizable()
            .frame(width: 115, height: 115)
            .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
        Image("tmp")
            .resizable()
            .frame(width: 115, height: 115)
            .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
        Image("tmp")
            .resizable()
            .frame(width: 115, height: 115)
            .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
    }
}

struct ChangeFlowers: View {
    let flowerImages = [Constants.FLOWER_1, Constants.FLOWER_2, Constants.FLOWER_3]
    @Binding var randomFlowers: Array<Int>
    var body: some View {
        Image(flowerImages[randomFlowers[0]])
            .resizable()
            .frame(width: 115, height: 115)
        Image(flowerImages[randomFlowers[1]])
            .resizable()
            .frame(width: 115, height: 115)
        Image(flowerImages[randomFlowers[2]])
            .resizable()
            .frame(width: 115, height: 115)
    }
}

func getRandomValues() -> Array<Int> {
    return [Int.random(in: 0..<Constants.NUMB_FLOWERS),
            Int.random(in: 0..<Constants.NUMB_FLOWERS),
            Int.random(in: 0..<Constants.NUMB_FLOWERS)]
}

struct GoButton: View {
    @Binding var showReset: Bool
    @Binding var showGo: Bool
    @Binding var defaultFlowers: Bool
    @Binding var moneyRemaining: Int
    @Binding var randomFlowers: Array<Int>
    @Binding var isRotated: Bool
    
    var animation: Animation {
        Animation.linear(duration: 0.5)
            .repeatCount(3, autoreverses: false)
            .speed(3.0)
    }
    
    var body: some View {
        Button(action: {
            if showReset == false {
                showReset.toggle()
            }
            if defaultFlowers {
                defaultFlowers.toggle()
            }
            withAnimation(animation) {
                self.isRotated.toggle()
            }
            randomFlowers = getRandomValues()
            moneyRemaining -= Constants.COST_PER_ROLL
            moneyRemaining += checkMatchingFlowers(flowerIndexList: randomFlowers)
            
            if moneyRemaining == Constants.YOUR_BROKE {
                showGo.toggle()
            }
        }) {
            Image("go")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}

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

func checkMatchingFlowers(flowerIndexList: Array<Int>) -> Int {
    var flower1 = 0
    var flower2 = 0
    var flower3 = 0
    
    for flower in flowerIndexList {
        if flower == 0 {
            flower1 += 1
        }
        else if flower == 1 {
            flower2 += 1
        }
        else {
            flower3 += 1
        }
    }
    
    if flower1 == 2 || flower2 == 2 || flower3 == 2 {
        return Constants.MATCH_2
    }
    else if flower1 == 3 || flower2 == 3 || flower3 == 3 {
        return Constants.MATCH_3
    }
    
    return Constants.MATCH_0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
