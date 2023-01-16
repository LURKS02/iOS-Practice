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
            
            ZStack {
                Image("signImg")
                    .resizable()
                    .scaledToFill()
                
                
                VStack {
                    Text("잠깐!\n[펫니티](link1)가 처음이신가요?")
                        .fontWeight(.bold)
                        .font(.title)
                        .lineSpacing(5)
                        .padding(.top, 170)
                        .foregroundColor(Color(red: 150/255, green: 150/255, blue: 150/255))
                        .tint(Color(red: 89/255, green: 170/255, blue: 175/255))
                    
                    
                    Spacer().frame(height:30)
                    
                    Text("간단한 회원가입으로\n펫니티의 모든 서비스를 이용하실 수 있어요! ")
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .lineSpacing(2)
                    
                    Spacer()
                    
                    NavigationLink (
                        destination: SignInView(),
                        label: {
                            Text("회원가입 하기")
                                .fontWeight(.semibold)
                                .font(.title2)
                                .foregroundColor(Color(red: 78/255, green: 78/255, blue: 78/255))
                                .lineSpacing(25)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 20)
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .cornerRadius(40)
                        })
                    .padding(10)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("뒤로가기")
                    .navigationBarHidden(true)
                    
                    NavigationLink (
                        destination:
                            LoginView(),
                        label: {
                            Text("기존 아이디로 로그인하기")
                                .foregroundColor(Color(red: 132/255, green: 132/255, blue: 132/255, opacity: 1.0))
                                .underline()
                                .fontWeight(.bold)
                                .font(.footnote)
                                .padding(.bottom, 350)
                        })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
