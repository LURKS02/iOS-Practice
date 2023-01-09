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
                Text("잠깐!\n펫니티가 처음이신가요?")
                .fontWeight(.bold)
                .font(.title)
                .lineSpacing(5)
                
                Spacer().frame(height:30)
                
                Text("간단한 회원가입으로\n펫니티의 모든 서비스를 이용하실 수 있어요! ")
                .fontWeight(.medium)
                .font(.subheadline)
                .lineSpacing(2)
                
                Spacer().frame(height: 270)
                
                NavigationLink (
                destination: NextView(),
                label: {
                    Text("회원가입 하기")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .lineSpacing(25)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .cornerRadius(40)
                })
                
                Spacer().frame(height: 15)
                
                Text("기존 아이디로 로그인하기")
                .underline()
                .fontWeight(.bold)
                .font(.footnote)
                
            }
        }
    }
}

struct NextView: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("이름")
            .font(.body)
            .lineSpacing(22)
            .padding(.trailing, 53)

            Text("이름을 입력하세요.")
            .font(.body)
            .lineSpacing(22)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 7)
        .padding(.leading, 8)
        .padding(.trailing, 14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .frame(width: 343)
        
        HStack(spacing: 0) {
            Text("이메일")
            .font(.body)
            .lineSpacing(22)
            .padding(.trailing, 37)

            Text("이메일을 입력하세요.")
            .font(.body)
            .lineSpacing(22)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 7)
        .padding(.leading, 8)
        .padding(.trailing, 14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .frame(width: 343)
        
        Rectangle()
        .frame(width: 370, height: 1)
        
        HStack(spacing: 0) {
            Text("비밀번호")
            .font(.body)
            .lineSpacing(22)
            .padding(.trailing, 23)

            Text("비밀번호를 입력하세요.")
            .font(.body)
            .lineSpacing(22)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 7)
        .padding(.leading, 8)
        .padding(.trailing, 14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .frame(width: 343)
        
        HStack(spacing: 0) {
            Text("비밀번호 재입력")
            .font(.body)
            .lineSpacing(22)
            .padding(.trailing, 23)

            Text("비밀번호를 다시 입력하세요.")
            .font(.body)
            .lineSpacing(22)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 7)
        .padding(.leading, 8)
        .padding(.trailing, 14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .frame(width: 343)
        
        Rectangle()
        .frame(width: 370, height: 1)
        
        Spacer().frame(height: 200)
        
        Text("회원가입")
        .fontWeight(.semibold)
        .font(.title3)
        .lineSpacing(25)
        .padding(.horizontal, 22)
        .padding(.vertical, 17)
        .frame(width: 296, height: 53)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


