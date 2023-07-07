//
//  BeerRepository+Real.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/20.
//

import Foundation
import Combine

class RealBeerRepository: BeerRepository {
    func fetchBeers(onFetched: @escaping ([Beer]) -> Void) {
        let url = URL(string: "https:api.punkapi.com/v2/beers")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "get"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    let beersResponse = try! JSONDecoder().decode([BeerResponseItem].self, from: data)
                    let beerList = beersResponse.map { $0.toDomainModel() }
                    onFetched(beerList)
                } else {
                    print("Request failed with status code: \(response.statusCode)")
                }
            } else {
                print("Request failed with error: \(error!)")
            }
        }
        task.resume()
    }
    
    // 3/6 1번 과제
    func asyncFetchBeers() async throws -> [Beer] {
        let url = URL(string: "https:api.punkapi.com/v2/beers")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        /*
        do {
            let (data, response) = await URLSession.shared.data(from: url)
        } catch {
            switch error {
            case .
            }
        }
         */

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            return []
        }
        
        let beersResponse = try JSONDecoder().decode([BeerResponseItem].self, from: data)
        let beerList = beersResponse.map { $0.toDomainModel() }
        return beerList
    }

    // 3/6 2번 과제
    func fetchBeersPublisher() -> AnyPublisher<[Beer], Never> {  //아웃풋 타입 + 에러 타입
        let url = URL(string: "https:api.punkapi.com/v2/beers")!
        var urlRequest = URLRequest(url: url)
        
        /*let myURLSession = URLSession(configuration: .default)
         myURLSession.makeURLPublisher(<#T##urlRequest: URLRequest##URLRequest#>, decodedType: <#T##Decodable.Protocol#>)
         */
        
        /*Publishers.CombineLatest(
            URLSession.shared.makeURLPublisher(urlRequest, decodedType: [BeerResponseItem].self),
            URLSession.shared.makeURLPublisher(urlRequest2, decodedType: [BeerResponseItem].self)
        )
        .map {
            $0, $1 in
        }*/
        
        return URLSession.shared.makeURLPublisher(urlRequest, decodedType: [BeerResponseItem].self)
            .map { $0.map { $0.toDomainModel() } }
            .eraseToAnyPublisher()
    }
}

extension RealBeerRepository {
    func makeURLPublisher<Response: Decodable>(_ urlRequest: URLRequest, decodedType: Response.Type) -> AnyPublisher<Response, Never> {
        // 3/14 1번 과제
        return URLSession.shared.dataTaskPublisher(for: urlRequest.url!)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .assertNoFailure()
            .eraseToAnyPublisher()
    }
}

class BeerCombine : ObservableObject {
    @Published var beers: [Beer] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchBeersPublisher()
    }
    
    // 3/6 2번 과제 (내가 한것)
    func fetchBeersPublisher() {
        let url = URL(string: "https:api.punkapi.com/v2/beers")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { data, response in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [BeerResponseItem].self, decoder: JSONDecoder())
            .assertNoFailure()
            .sink(receiveValue: {[weak self] returnedBeers in
                self?.beers = returnedBeers.map { $0.toDomainModel() }
            })
            .store(in: &cancellables)
    }
}


