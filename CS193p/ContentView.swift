//
//  ContentView.swift
//  CS193p
//
//  Created by Mami Ravaloarison on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView()
        }
        .padding()
    }
}


struct CardView: View {
    var body: some View {
        ZStack {
            Rectangle()
            Text("🧠").font(.largeTitle)
        }
    }
}


#Preview {
    ContentView()
}
