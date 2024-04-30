//
//  ContentView.swift
//  LeetcodePractice
//
//  Created by Sarah Clark on 4/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "book")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Leetcode Practice!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
