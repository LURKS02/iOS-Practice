import PlaygroundSupport
import SwiftUI

struct PlayButton: View {
    @State private var toggleValue: Bool = true
    
    var body: some View {
        VStack {
            TextView(toggleV: toggleValue)
            ButtonView(toggleV: $toggleValue)
        }
    }
}

struct TextView: View {
    var toggleV: Bool
    
    var body: some View {
        Text(toggleV ? "On" : "Off")
    }
}

struct ButtonView: View {
    @Binding var toggleV: Bool
    
    var body: some View {
        Button(action: {toggleV.toggle()}) {
            Text("클릭")
        }
    }
}

PlaygroundPage.current.setLiveView(PlayButton())
