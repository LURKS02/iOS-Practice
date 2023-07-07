//
//  DI.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/20.
//

import Foundation

class DIContainer {
    init() {
        
    }
    
    func getBeerRepository(isReal: Bool) -> BeerRepository {
        isReal ? RealBeerRepository() : MockRepository()
    }
}
