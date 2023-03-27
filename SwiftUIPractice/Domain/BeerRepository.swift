//
//  BeerRepository.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/20.
//

import Foundation
import Combine

protocol BeerRepository {
    func fetchBeers(onFetched: @escaping ([Beer]) -> Void)
    func asyncFetchBeers() async throws -> [Beer]
    func fetchBeersPublisher() -> AnyPublisher<[Beer], Never>
}
//도메인
//@escaping : 이 함수는 지금 쓸것이 아니요 나중에 쓸것이요

struct MockRepository: BeerRepository {
    func fetchBeers(onFetched: @escaping ([Beer]) -> Void) {
        onFetched([
            .init(
                id: 3,
                name: "존맛탱 구리 맥주",
                tagline: "뭔지 모름 이거",
                first_brewed: "1932190132",
                description: "줜 맛 탱",
                image_url: "https://picsum.photos/200/300"
            )
        ])
    }
    
    func asyncFetchBeers() async throws -> [Beer] {
        return [
            .init(
                id: 3,
                name: "존맛탱 구리 맥주",
                tagline: "뭔지 모름 이거",
                first_brewed: "1932190132",
                description: "줜 맛 탱",
                image_url: "https://picsum.photos/200/300"
            )]
    }
    
    func fetchBeersPublisher() -> AnyPublisher<[Beer], Never> {
        Just<[Beer]>([
            .init(
                id: 3,
                name: "존맛탱 구리 맥주",
                tagline: "뭔지 모름 이거",
                first_brewed: "1932190132",
                description: "줜 맛 탱",
                image_url: "https://picsum.photos/200/300"
            )
        ])
        .eraseToAnyPublisher()
    }
}
