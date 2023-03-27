//
//  BeerView.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/20.
//

import SwiftUI
import Combine

struct BeerView: View {
    
    @StateObject var beerViewModel = ViewModel()
    //let repo = DIContainer().getBeerRepository(isReal: true)
//    @StateObject var repo = BeerCombine()
    
    /*
     class로 만든 애가 object(객체)인데
     왜 observedObject를 따로 쓰냐??
     
     State는 value를 비교해서 바뀌면 다시 랜더링을 한다.
     observableObject는 @Published가 바뀌면 이 뷰의 랜더링을 다시 해준다.
     
     */
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(beerViewModel.beers) { beer in
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
        .task {
            self.beerViewModel.fetchBeers()
        }
        /*
        .task {
            try? await self.beers = repo.asyncFetchBeers()
        }*/
        /*.onAppear {
            repo.fetchBeers { beers in
                self.beers = beers
            }
        }
         */
    }
}

class ViewModel: ObservableObject {
    @Published var beers: [Beer] = []
    
    /*let repo = DIContainer().getBeerRepository(isReal: true)
    var cancelBag = Set<AnyCancellable>()
    
    func fetchBeers() {
        repo.fetchBeersPublisher()
            .sink(receiveValue: {
                self.beers = $0
            })
            .store(in: &cancelBag)
    }
     */
    
    let repo = DIContainer().getBeerRepository(isReal: true)
    var cancelBag = Set<AnyCancellable>()
    
    /*func fetchBeers() {
        repo.loadBeersPublisher()
            .sink(receiveValue: {
                self.beers =
                $0.map { $0.toDomainModel()}}
                  )
            .store(in: &cancelBag)
    }*/
    
    func fetchBeers() {
        repo.domainModelBeersPublisher()
            .sink(receiveValue: {
                self.beers = $0
            })
            .store(in: &cancelBag)
    }
}

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView()
    }
}

struct BeerRow: View {
    var id: Int
    var name: String
    var tagline: String
    var first_brewed: String
    var description: String
    var image_url: String
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: image_url), scale: 3)
            
            Spacer().frame(height: 20)
            
            Text(name)
                .fontWeight(.semibold)
                .font(.title3)
            Text(tagline)
                .foregroundColor(.blue)
            
            Spacer()
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(maxHeight: 50)
            
            
            
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
    }
}
