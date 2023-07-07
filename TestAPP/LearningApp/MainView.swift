//
//  MainView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/15.
//

import SwiftUI

struct MainView: View {
    let gradient = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: .white, location: 0),
                .init(color: .clear, location: 0.4)
            ]),
            startPoint: .top,
            endPoint: .bottom
            )
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                Image("dogImg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 393, height: 370)
                    .clipped()
                    .overlay (gradient)
                
                Spacer().frame(height:30)
                
                HStack (alignment: .bottom) {
                    Text("쫑이")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.trailing, 7)

                    Text("3살")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))

                    Text("10kg")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))

                    Spacer()
                    
                    Text("19.10.11")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                }
                .padding(.horizontal, 30)
                
                Spacer().frame(height: 25)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("웰시코기")
                            .fontWeight(.semibold)
                            .font(.title3)
                            .foregroundColor(Color(red: 0.23, green: 0.23, blue: 0.23))
                        
                        Spacer().frame(height: 3)
                        
                        Text("서울특별시 마포구 망원동")
                            .fontWeight(.semibold)
                            .font(.title3)
                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                }
                
                Spacer().frame(height: 40)
                
                HStack {
                    Text("오늘의 산책")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .lineSpacing(22)

                    Rectangle()
                    .frame(width: 233, height: 1)
                    .foregroundColor(Color(red: 0.82, green: 0.82, blue: 0.82))
                }
                
                HStack {
                    Text("1.3 km ")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 0.37, green: 0.68, blue: 0.68)) +
                    Text("를 걸었어요!")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                Image("mapImg1")
                    .resizable()
                    .frame(width: 393, height: 350)
            }
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
