//
//  ReducePractice.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/20.
//

import SwiftUI

var reduceNum = [0,1,2,3,4,5,6,7,8,9,10].filter{ $0 % 2 == 1}.reduce(0){$0+$1*2}

func sumOddMultiply2(input: [Int]) -> Int {
    return input
        .filter{ $0 % 2 == 1}
        .reduce(0){ $0+$1*2 }
    
    // method chaining
    // 점을 계속 찍을수있음
    // 리턴타입이 이어지는거임~~~ 정말 신기해~!
    
    /*
     VStack {
         
     } 뷰 리턴
     .background() 뷰 리턴
     .background(in: <#T##InsettableShape#>) 뷰 리턴
     .foregroundColor(<#T##color: Color?##Color?#>) 뷰 리턴
     메서드 체이닝인거임~~! 정말 최고야!
     
     */
}

struct ReducePractice: View {
    var body: some View {
        Text(String(reduceNum))
    }
}

struct ReducePractice_Previews: PreviewProvider {
    static var previews: some View {
        ReducePractice()
    }
}
