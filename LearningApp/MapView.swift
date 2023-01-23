import SwiftUI
import NMapsMap
import NMapsGeometry

struct MapView: View {
    var body: some View {
        ZStack {
                    UIMapView()
                        .edgesIgnoringSafeArea(.vertical)
            }
    }
}

struct UIMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
      
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
