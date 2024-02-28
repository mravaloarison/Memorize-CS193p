//
//  ContentView.swift
//  CS193p
//
//  Created by Mami Ravaloarison on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🧠", "🫁", "🫀", "👃", "👂", "👅", "🦷", "👄"]
    
    @State var countCard = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            handleCardsToDisplay
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], content: {
            ForEach(0..<countCard, id: \.self) { index in CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        })
        .foregroundColor(.blue)
    }
    
    func countCardAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            countCard += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(countCard + offset < 1 || countCard + offset > emojis.count)
    }
    
    var handleCardsToDisplay: some View {
        HStack {
            removeCardsButton
            Spacer()
            addCardsButton
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    var addCardsButton: some View {
        countCardAdjuster(by: +1, symbol: "rectangle.stack.badge.plus")
    }
    
    var removeCardsButton: some View {
        countCardAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let card = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)

            Group {
                card.fill(.white)
                card.stroke(.blue, style: StrokeStyle(lineWidth: 2.5))
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            card.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
