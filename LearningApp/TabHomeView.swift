//
//  TabHomeView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/18.
//

import SwiftUI

struct TabHomeView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "person")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                }
        }
        .accentColor(Color(red: 0.37, green: 0.68, blue: 0.68))
    }
}

struct TabHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabHomeView()
    }
}
