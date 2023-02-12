//
//  Tag.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/06.
//

import SwiftUI

//뷰 합성
//고차뷰

//struct Tag<Content: View>: View {
//    @ViewBuilder
//    var content: () -> Content
//
//
//    var body: some View {
//        HStack {
//            content()
//        }
//        .padding(.vertical, 5)
//        .padding(.horizontal, 10)
//        .foregroundColor(.white)
//        .background(Color.gray)
//        .cornerRadius(20)
//        .frame(maxHeight: 20)
//
//    }
//}

struct TagModifier: ViewModifier {
    var color: Color = .white
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .foregroundColor(color)
            .background(Color.gray)
            .cornerRadius(20)
            .frame(maxHeight: 20)
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    Text("good night!")
                        .modifier(TagModifier(color: .red))
                    
                    Button(action: {}) {
                        Image("")
                    }
                }
            }
        }
        
    }
}
