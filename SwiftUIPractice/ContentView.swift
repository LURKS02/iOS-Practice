//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/05.
//

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

struct ContentView: View {
    
    @State private var thumbnails:
    [YoutubeThumbnailData] = [YoutubeThumbnailData(imageSource: "maxresdefault", uploader: YoutubeThumbnailData.Uploader(profileSource: "maxresdefault", name: "디해"), title: "돈버는 유튜브", hits: 130, date: Date()), YoutubeThumbnailData(imageSource: "thumb", uploader: YoutubeThumbnailData.Uploader(profileSource: "thumb", name: "냥냥이"), title: "냥냥", hits: 200, date: Date()),YoutubeThumbnailData(imageSource: "thumb-2", uploader: YoutubeThumbnailData.Uploader(profileSource: "thumb-2", name: "뇨뇨"), title: "유튜브닷", hits: 500, date: Date()),YoutubeThumbnailData(imageSource: "swif", uploader: YoutubeThumbnailData.Uploader(profileSource: "swif", name: "냐냥"), title: "안뇽~", hits: 400, date: Date())]
    
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
    }
}

struct YoutubeThumbnail: View {
    let id: UUID
    var imageSource: String
    var uploader: YoutubeThumbnailData.Uploader
    var title: String
    var hits: Int
    var date: Date

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
            }.padding(.leading)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
