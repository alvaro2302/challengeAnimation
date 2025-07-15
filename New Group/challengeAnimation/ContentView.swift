//
//  ContentView.swift
//  challengeAnimation
//
//  Created by Alvaro Cuiza on 14/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Image("diskExample").resizable().scaledToFit()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
