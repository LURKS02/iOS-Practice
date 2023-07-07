//
//  HomeworkBeerView.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/27.
//

import SwiftUI
import Combine

struct HomeworkBeerView: View {
    //리컴퓨팅을 해서 확인하고 바뀐 데이터가 있으면 리렌더링울 하는거임
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.beers) { beer in
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
        .onAppear(perform: vm.fetchBeers)
    }
}

extension HomeworkBeerView {
    class ViewModel: ObservableObject {
        let repo: BeerRepository
        
        var cancelBag = Set<AnyCancellable>()
        
        @Published var beers: [Beer] = []
        
        init(repo: BeerRepository) {
            self.repo = repo
        }
        
        func fetchBeers() {
            repo.fetchBeers(onFetched: { [weak self] beers in
                self?.beers = beers
            })
            //onfetched는 비동기 함수이다. 이때 클로저 내부의 함수는 바깥것과는 완전 다른 거임 그래서 비동기라서 돌아와서 보니깐 self가 있는지없느지 확실하지않기때문에 옵셔널을 붙여준거임
            //onfetched는 viewmodel을 의존하고있는거임 viewmodel의 beers라는 값을 바꿔주기때문에. 만약 weak self를 안썼다고 하면??
            //fetchBeers()를 호출하여 서버에서 값을 받아오는 중에 유저가 뒤로가기를 누른다 하면 self라는 애에 대한 의존성이 있기 때문에 함수를 실행하고 fetching이 되기 전까지는 arc가 1인거임 메모리상에 들고는잇음 일단 즉 viewmodel이 메모리 할당 해제되어있지 않음 weak를 붙이면 옵셔널 값으로 다 바뀐다. 옵셔널은 Type? 이고 있을수도있고 없을수도있는값임. self?.라는 뜻은 불러오는동안 내가 있을수도있고 없을수도있다는거임
        }
    }
}



struct HomeworkBeerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeworkBeerView(vm: .init(repo: DIContainer().getBeerRepository(isReal: false)))
    }
}
