//
//  HTTP+Publisher.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/03/20.
//

import Foundation
import Combine

extension URLSession {
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
