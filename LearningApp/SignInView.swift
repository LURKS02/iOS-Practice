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
            
                Spacer().frame(height: 50)
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("이름")
                            .font(.body)
                            .padding(.bottom, 15)
                        
                        Text("이메일")
                            .font(.body)
                    }
                    
                    Spacer().frame(width: 30)
                    
                    VStack(alignment: .leading) {
                        Text("이름을 입력하세요.")
                            .font(.body)
                            .padding(.bottom, 15)
                            .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100))
                        
                        Text("이메일을 입력하세요.")
                            .font(.body)
                            .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100))
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 15)
                .padding(.leading, 8)
                .padding(.trailing, 14)
                .frame(width: 343)
                
                Rectangle()
                .frame(width: 370, height: 1)
                .foregroundColor(Color(red: 228/255, green: 228/255, blue: 228/255))
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("비밀번호")
                            .font(.body)
                            .padding(.bottom, 15)
                        
                        Text("비밀번호 재입력")
                            .font(.body)
                    }
                    
                    Spacer().frame(width: 30)
                    
                    VStack(alignment: .leading) {
                        Text("비밀번호를 입력하세요.")
                            .font(.body)
                            .padding(.bottom, 15)
                            .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100))
                        
                        Text("비밀번호를 재입력하세요.")
                            .font(.body)
                            .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100))
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 15)
                .padding(.leading, 8)
                .padding(.trailing, 14)
                .frame(width: 343)
                
                Rectangle()
                .frame(width: 370, height: 1)
                .foregroundColor(Color(red: 228/255, green: 228/255, blue: 228/255))
                
                Spacer().frame(height: 70)
                
                Text("회원가입")
                .fontWeight(.semibold)
                .font(.title3)
                .lineSpacing(25)
                .padding(.horizontal, 22)
                .padding(.vertical, 17)
                .frame(width: 296, height: 53)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .cornerRadius(40)
                
                Spacer()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
