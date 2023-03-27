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
    func youtubeTag() -> some View {
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
                .youtubeTag()
                
                HStack {
                    Image(systemName: "plus.square.on.square")
                    Text("리믹스")
                }
                .youtubeTag()
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("공유")
                }
                .youtubeTag()
                
                HStack {
                    Image(systemName: "square.and.arrow.down")
                    Text("오프라인 저장")
                }
                .youtubeTag()
                
                MyButton(text: "zz") { text in
                    HStack {
                        Image(systemName: "square.and.arrow.down")
                        Text("오프라인 저장")
                    }
                }
            }
            .frame(height: 100)
            //이거 지정 안하면 잘려보이는데 일일히 해야하는건강??
        }
    }
}

struct MyButton<Content: View>: View {
    let text: String
    let content: (ScrollViewProxy) -> Content
    
    var body: some View {
        Button(action: {}) {
            //callback 함수는 외부에서 구현하도록 한다.
        }
        .foregroundColor(Color.red)
    }
}

struct TagExercise_Previews: PreviewProvider {
    static var previews: some View {
        TagExercise()
    }
}
