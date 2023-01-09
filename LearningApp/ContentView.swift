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
        NavigationView {
            VStack {
                Text("잠깐! 펫니티가 처음이신가요?")
                    .font(.title)
                    .padding()
                Text("간단한 회원가입으로 펫니티의 모든 서비스를 이용하실 수 있어요!")
                
                NavigationLink (
                destination: NextView(),
                label: {
                    Text("navigate")
                })
                
                
            }
        }
    }
}

struct NextView: View {
    var body: some View {
        Text("두번째 화면")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
