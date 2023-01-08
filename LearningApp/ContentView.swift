//
//  ContentView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/08.
//

import SwiftUI

struct ContentView: View {
    
    @State var touchedCount = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            NavigationView {
                Form {
                    
                    Text("Hello, world!")
                    Text("버튼을 클릭한 횟수 :  \(touchedCount)")
                    Button("This is Button") {
                        self.touchedCount += 1
                    }
                    
                    
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
