//
//  KAKAOView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/23.
//

import SwiftUI

struct KAKAOView: View {
    var body: some View {
        KakaoMapView()
    }
}

struct KakaoMapView: UIViewRepresentable {
    func updateUIView(_ uiView: MTMapView, context: Context) {}
    
    
    func makeUIView(context: Context) -> MTMapView {
        let view = MTMapView()
        view.currentLocationTrackingMode = .onWithoutHeading
        view.showCurrentLocationMarker = true
        
        return view
    }
}

struct KAKAOView_Previews: PreviewProvider {
    static var previews: some View {
        KAKAOView()
    }
}
