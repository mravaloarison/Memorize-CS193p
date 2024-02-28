//
//  ContentView.swift
//  CS193p
//
//  Created by Mami Ravaloarison on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    let handPosesEmojis = ["✌️", "🫰", "🤟", "🤌", "👌", "☝️"]
    let animalEmojis = ["🐼", "🐶", "🐬", "🦦", "🦭", "🐻"]
    let fruitEmojis = ["🥑", "🍐", "🍓", "🍌", "🍑", "🍍"]

    @State var countCard = 6
    @State var cardShown: [String]
    
    init() {
        _cardShown = State(initialValue: fruitEmojis)
    }

    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themesChoice
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], content: {
            ForEach(0..<countCard, id: \.self) { index in CardView(content: cardShown[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        })
        .foregroundColor(.blue)
    }
    
    var themesChoice: some View {
        HStack(spacing: 60, content: {
            themeOne
            themeTwo
            themeThree
        })
        .padding(.horizontal)
    }
    
    func chooseTheme(themeName: String) -> some View {
        Button (action: {
            if themeName == "Hand poses" {
                cardShown = handPosesEmojis
            } else if themeName == "Animals" {
                cardShown = animalEmojis
            } else {
                cardShown = fruitEmojis
            }
        }, label: {
            Text(themeName)
        })
    }
    
    var themeOne: some View {
        chooseTheme(themeName: "Hand poses")
    }
    
    var themeTwo: some View {
        chooseTheme(themeName: "Animals")
    }
    
    var themeThree: some View {
        chooseTheme(themeName: "Fruits")
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
