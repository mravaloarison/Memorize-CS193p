//
//  ContentView.swift
//  CS193p
//
//  Created by Mami Ravaloarison on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    let handPosesEmojis = ["✌️", "🫰", "🤟", "🤌", "👌", "☝️", "✌️", "🫰", "🤟", "🤌", "👌", "☝️"]
    let animalEmojis = ["🐼", "🐶", "🐬", "🦦", "🦭", "🐻", "🐦‍⬛","🐼", "🐶", "🐬", "🦦", "🦭", "🐻", "🐦‍⬛"]
    let fruitEmojis = ["🥑", "🍐", "🍓", "🍌", "🍑", "🍍", "🥝", "🍉","🥑", "🍐", "🍓", "🍌", "🍑", "🍍", "🥝", "🍉"]

    @State var countCard = 4
    @State var cardShown: [String]
    
    init() {
        _cardShown = State(initialValue: fruitEmojis.shuffled())
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
            ForEach(0..<cardShown.count, id: \.self) { index in CardView(content: cardShown[index])
                    .aspectRatio(5/6, contentMode: .fit)
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
    
    func chooseTheme(themeName: String, imageRepresenting: String) -> some View {
        Button (action: {
            let emojiThemes: [String: [String]] = [
                "Hand poses": handPosesEmojis,
                "Animals": animalEmojis,
                "Fruits": fruitEmojis
            ]
            cardShown = (emojiThemes[themeName]?.shuffled())!
        }, label: {
            VStack {
                Image(systemName: imageRepresenting).font(.largeTitle)
                Text(themeName)
            }
            
        })
    }
    
    var themeOne: some View {
        chooseTheme(themeName: "Hand poses", imageRepresenting: "hand.draw.fill")
    }
    
    var themeTwo: some View {
        chooseTheme(themeName: "Animals", imageRepresenting: "tortoise.fill")
    }
    
    var themeThree: some View {
        chooseTheme(themeName: "Fruits", imageRepresenting: "applelogo")
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
