//
//  SignInView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/10.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        
        VStack {
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
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
