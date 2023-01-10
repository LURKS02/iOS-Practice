//
//  SwiftUIView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/10.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(.red)
                .padding(.top, 200)
            Text("padding test")
                .background(.yellow)
                .padding(.leading, 100)
            Text("TEST")
                .background(.blue)
                .padding()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
