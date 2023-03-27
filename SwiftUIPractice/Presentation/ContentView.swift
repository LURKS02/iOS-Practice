//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/05.
//

/*
 
 ㄹ
 ㅇㄴㄹ
 ㅁㅇㄹ
 ㅇㅁ
 ㄴㄹ ㅎ
 ㅎㅇ ㅎㅇ 지혜 ㅎㅇ!
 
 전체선택 후 ctrl i 하면 자동 정렬됨
 */

import SwiftUI

struct YoutubeThumbnailData : Identifiable {
    struct Uploader {
        var profileSource: String
        var name: String
    }
    let id = UUID()
    
    var imageSource: String
    var uploader: Uploader
    var title: String
    var hits: Int
    var date: Date
}
//서버에서 보내주는 데이터

struct ContentView: View {
    
    @State private var thumbnails:
    [YoutubeThumbnailData] = [
        .init(
            imageSource: "maxresdefault",
            uploader: .init(
                profileSource: "maxresdefault",
                name: "디해"
            ),
            title: "돈버는 유튜브",
            hits: 130,
            date: Date()
        ),
        .init(
            imageSource: "thumb",
            uploader: .init(profileSource: "thumb", name: "냥냥이"),
            title: "냥냥",
            hits: 200,
            date: Date()
        ),
        .init(
            imageSource: "thumb-2",
            uploader: .init(profileSource: "thumb-2", name: "뇨뇨"),
            title: "유튜브닷",
            hits: 500,
            date: Date()
        ),
        .init(
            imageSource: "swif",
            uploader: .init(profileSource: "swif", name: "냐냥"),
            title: "안뇽~",
            hits: 400,
            date: Date()
        )
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(thumbnails) { thumbnail in
                    YoutubeThumbnail(
                        id: thumbnail.id,
                        imageSource: thumbnail.imageSource,
                        uploader: thumbnail.uploader,
                        title: thumbnail.title,
                        hits: thumbnail.hits,
                        date: thumbnail.date
                    )
                }
            }
        }
        .onAppear {
            /*getBeers { beers in
                thumbnails = .init(beer.s)
            }
             */
        }
    }
}


struct YoutubeThumbnail: View {
    let id: UUID
    var imageSource: String
    var uploader: YoutubeThumbnailData.Uploader
    var title: String
    var hits: Int
    var date: Date
    //view에서 쓸 데이터
//    var profileSource: String
//    var uploaderName: String
    //멍청한게 좋다

    @ViewBuilder
    var body: some View {
        VStack {
            thumnail
            
            HStack {
                Image(uploader.profileSource)
                    .resizable()
                    .frame(width:50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(title)
                    row
                }
                Spacer()
            }
            .padding(.leading)
        }
    }
    
    @ViewBuilder
    var thumnail: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(imageSource).resizable()
                .scaledToFill()
        }
    }
    
    @ViewBuilder
    var row: some View {
        HStack {
            Text(uploader.name)
            Text("조회수 " + String(hits) + "회")
            
        }
    }
    
    @ViewBuilder
    var test: some View {
        HStack {
        }
        HStack {
        }
    }
    
    @ViewBuilder
    var testParent: some View {
        VStack {
            test
        }
    }
    
    //Group으로 묶어줌
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
