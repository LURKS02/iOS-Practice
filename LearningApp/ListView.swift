//
//  ListView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/18.
//

import SwiftUI

struct cardData: Identifiable {
    
    var id = UUID()
    var image: String
    var title: String
    var location: String
    
    var name: String
    var age: String
    var des: String
}

struct ListView: View {
    
    let data: [cardData] = [
        cardData(image: "dogImg", title: "안녕하세요", location: "성동구 행당동", name: "초코", age: "4살", des: "1km"), cardData(image: "dogImg", title: "다음글", location: "성동구 홍익동", name: "뽀삐", age: "2살", des: "500m")]
    
    
    var body: some View {
        
        List(data) { card in
            CardView(
                image: card.image,
                title: card.title,
                location: card.location,
                name: card.name,
                age: card.age,
                des: card.des)
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

struct CardView: View{
    var image: String
    var title: String
    var location: String
    var name: String
    var age: String
    var des: String
    
    var body: some View{
       
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(width: 346, height: 140)
                .shadow(color: .gray, radius: 3, x: 2, y: 2)
            
            HStack(alignment: .top) {
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode:.fill)
                    .frame(width: 150, height: 140)
                    .clipped()
                
                VStack(alignment: .leading){
                    
                    Spacer().frame(height: 10)
                    
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                    
                    Text(location)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                    
                    Spacer()
                    
                    
                    HStack {
                        Text(name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                        
                        Text(age)
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                        
                        Spacer()
                        
                        Text(des)
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                        
                        Spacer().frame(width: 5)
                    }
                    .padding(.bottom, 5)
                    
                }
                .padding(5)
                Spacer()
            }
            .cornerRadius(25)
            .frame(width: 346, height: 140)
            
        }
        
        
    }
}
