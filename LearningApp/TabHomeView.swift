//
//  TabHomeView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/18.
//

import SwiftUI

struct TabHomeView: View {
    
    @State var selection = 1
    
    var body: some View {
        TabView (selection: $selection) {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(1)
            
            ListView()
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(2)
            
            KAKAOView()
                .tabItem {
                    Image(systemName: "map")
                }
                .tag(3)
            
        }.navigationTitle(selection == 2 ? "산책 게시판" : "편의시설")
            .toolbar(selection == 1 ? .hidden : .visible, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .accentColor(Color(red: 0.37, green: 0.68, blue: 0.68))
    }
}

struct TabHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabHomeView()
    }
}
