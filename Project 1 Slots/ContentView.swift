//
//  ContentView.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    @State var showReset = false
    @State var defaultFlowers = true
    @State var flowerImages = ["f1", "f2", "f3"]
    @State var randomFlowers = getRandomValues()
    
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
                .padding(.bottom, 50)
                
                // Go Button
                Button(action: {
                    if showReset == false {
                        showReset.toggle()
                    }
                    if defaultFlowers {
                        defaultFlowers.toggle()
                    }
                    randomFlowers = getRandomValues()
                }) {
                    Image("go")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }

                Spacer()
                HStack {
                    GoldCoin()
                    MoneyTextView()
                    
                    // Reset Button
                    if showReset {
                        Button(action: {
                            showReset.toggle()
                            defaultFlowers.toggle()
                        }) {
                            Image("reset1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        }
                    }
                }
                .padding(.bottom, 50)
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
}

func getRandomValues() -> Array<Int> {
    return [Int.random(in: 0..<3), Int.random(in: 0..<3), Int.random(in: 0..<3)]
}

func GoButton(moneyRemaining: Int) -> some View {
    return Button(action: {
        print("go pressed")
    }) {
        Image("go")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

struct BottomLayout: View {
    var body: some View {
        HStack {
            GoldCoin()
            MoneyTextView()
            
            // Reset Button
            ResetButton()
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
    var body: some View {
        Text("$ 5")
            .font(.system(size: 40))
            .foregroundColor(Color.init("Money Color"))
            .padding(.trailing, 130)
    }
}

func ResetButton() -> some View {
    return Button(action: {
        print("reset press")
    }) {
        Image("reset1")
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
