//
//  SwiftUIView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/10.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            Text("I agree with [Terms & Use](link1) and [Privacy Policy](link2)")
                .foregroundColor(.gray)
                .tint(.blue)
                .navigationTitle("dd")
                
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
