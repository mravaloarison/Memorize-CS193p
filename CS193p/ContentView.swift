//
//  ContentView.swift
//  CS193p
//
//  Created by Mami Ravaloarison on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🧠", "🫁", "🫀"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in CardView(content: emojis[index])
            }
        }
        .foregroundColor(.blue)
        .padding()
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let card = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)

            if isFaceUp {
                card.fill(.white)
                card.stroke(.blue, style: StrokeStyle(lineWidth: 5))
                Text(content).font(.largeTitle)
            } else {
                card.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
