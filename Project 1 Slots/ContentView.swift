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
