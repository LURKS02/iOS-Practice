//
//  BeerData.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/20.
//

import Foundation
import SwiftUI
import Combine

struct BeerResponseItem: Codable {
    var id: Int
    var name: String
    var tagline: String
    var first_brewed: String
    var description: String
    var image_url: String
    
    func toDomainModel() -> Beer {
        .init(id: id, name: name, tagline: tagline, first_brewed: first_brewed, description: description, image_url: image_url)
    }
}

class HTTPClient: ObservableObject {
    @Published var beerList = [Beer]()
    
    init() {
        let url = URL(string: "https:api.punkapi.com/v2/beers")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "get"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    let beersResponse = try! JSONDecoder().decode([BeerResponseItem].self, from: data)
                    self.beerList = beersResponse.map { $0.toDomainModel() }
                } else {
                    print("Request failed with status code: \(response.statusCode)")
                }
            } else {
                print("Request failed with error: \(error!)")
            }
        }
        task.resume()
    }
}
// 역전이 된거임~~
