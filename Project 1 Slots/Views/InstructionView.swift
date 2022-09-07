//
//  InstructionView.swift
//  Project 1 Slots
//
//  Created by Andrew Nguyen on 9/7/22.
//

import SwiftUI

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
        .padding(.top, 100)
    }
}
