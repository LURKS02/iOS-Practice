//
//  ContentView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            NavigationView {
                Form {
                    Text("Hello, world!")
                }.navigationBarTitle("This is title")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
