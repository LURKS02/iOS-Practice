//
//  UnderstandingObservableObject.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/20.
//

import SwiftUI

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Screen: View {
    @State private var isDone: Bool = false
    @State private var person: Person = .init(name: "지혜")
    
    /*
     State는 값이 바뀌었을 때만 랜더링을 다시 해주는데
     class는 주소값을 가지고있는거기때문에 위의 경우는 class안의 값만 바뀐거라서 랜더링을 안해줌
     그래서 observedobject를 사용하는거임~
     */
    
    var body: some View {
        VStack {
            Text(person.name)
                .font(.title)
            BeerLists()
            Button(action: { isDone = true }) {
                Text("next")
                    .foregroundColor(.white)
                    
            }
            .frame(minWidth: 100, maxWidth: .infinity)
            .frame(height: 50)
            .background(content: { Color.gray })
            .cornerRadius(10)
            
        }
        .padding(20)
    }
}

struct BeerLists: View {
    @ObservedObject var httpClient: HTTPClient = HTTPClient()
    
    //StateObject를 써가지고 얘는 뷰가 랜더링대도 가마니 있을수 있는거임 
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(httpClient.beerList) { beer in
                    BeerRow(
                        id: beer.id,
                        name: beer.name,
                        tagline: beer.tagline,
                        first_brewed: beer.first_brewed,
                        description: beer.description,
                        image_url: beer.image_url
                    )
                }
            }
        }
    }
}

struct ItemRow: View {
    var title: String
    
    var body: some View {
        Text(title)
    }
}

struct UnderstandingObservableObject: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UnderstandingObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        Screen()
    }
}
