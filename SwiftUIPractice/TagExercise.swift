//
//  TagExercise.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/12.
//

import SwiftUI

struct YoutubeModifier: ViewModifier {
    func body(content: Content) -> some View {
        
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .foregroundColor(.black)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            .cornerRadius(20)
            .frame(maxHeight: 20)
        
    }
}

extension View {
    func YoutubeTag() -> some View {
        modifier(YoutubeModifier())
    }
}

struct TagExercise: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {

            HStack {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("4.3천 ")
                    Rectangle()
                        .frame(width: 1, height: 17)
                    Image(systemName: "hand.thumbsdown")
                }
                .YoutubeTag()
                
                HStack {
                    Image(systemName: "plus.square.on.square")
                    Text("리믹스")
                }
                .YoutubeTag()
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("공유")
                }
                .YoutubeTag()
                
                HStack {
                    Image(systemName: "square.and.arrow.down")
                    Text("오프라인 저장")
                }
                .YoutubeTag()
            }
            .frame(height: 100)
            //이거 지정 안하면 잘려보이는데 일일히 해야하는건강??
        }
    }
}

struct TagExercise_Previews: PreviewProvider {
    static var previews: some View {
        TagExercise()
    }
}
