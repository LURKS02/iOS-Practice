//
//  LoginView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/15.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View {
        Button(
            action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")    // back button 이미지
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.gray)
            }
    }
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 30)
            
            Image("logoImg")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(5)
            
            Text("우리동네 멍멍이 커뮤니티,")
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red:134/255, green: 134/255, blue: 134/255))
            
            Spacer().frame(height: 5)
            
            Text("펫니티!")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.title2)
                .foregroundColor(Color(red:134/255, green: 134/255, blue: 134/255))
                .padding(.bottom, 20)
            
            
            HStack(spacing: 0) {
                
                VStack(alignment: .leading) {
                    
                    Text("이메일")
                    .font(.body)
                    .padding(.bottom, 10)
                    
                    Text("비밀번호")
                    .font(.body)

                }
                .padding(.leading, 25)
                
                Spacer().frame(width: 30)
                
                VStack(alignment: .leading) {
                    TextField("이메일을 입력하세요.", text: $username)
                        .font(.body)
                        .padding(.bottom, 10)
                        .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100))
                    
                    SecureField("비밀번호를 입력하세요.", text: $password)
                        .font(.body)
                        .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100))
                    
                }
                Spacer()
            }
            .frame(width: 358, height: 105)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(red: 0.92, green: 0.92, blue: 0.92), lineWidth: 2))
            .padding(.bottom, 30)
            
            Text("아이디/비밀번호 찾기")
            .underline()
            .fontWeight(.bold)
            .font(.footnote)
            .foregroundColor(Color(red: 132/255, green: 132/255, blue: 132/255))
            
            NavigationLink (
            destination: TabHomeView(),
            label: {
                Text("로그인")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundColor(Color(red: 78/255, green: 78/255, blue: 78/255))
                    .lineSpacing(25)
                    .padding(.horizontal, 22)
                    .padding(.vertical, 17)
                    .frame(width: 296, height: 53)
                    .background(Color(red: 0.82, green: 0.87, blue: 0.88))
                    .cornerRadius(40)
                    .padding(5)
            })
            .navigationTitle("로그인하기")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
            
            
            NavigationLink (
            destination: SignInView(),
            label: {
                Text("회원가입")
                .fontWeight(.semibold)
                .font(.title3)
                .foregroundColor(Color(red: 78/255, green: 78/255, blue: 78/255))
                .lineSpacing(25)
                .padding(.horizontal, 22)
                .padding(.vertical, 17)
                .frame(width: 296, height: 53)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .cornerRadius(40)
            })
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
