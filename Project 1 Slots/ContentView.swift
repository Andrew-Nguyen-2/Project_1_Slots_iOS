//
//  ContentView.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("flowers3")
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Instructions
                Flowers
                Spacer()
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
