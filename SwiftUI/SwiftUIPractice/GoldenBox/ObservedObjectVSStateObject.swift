//
//  ObservedObjectVSStateObject.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/03/06.
//

import SwiftUI

struct ObservedObjectVSStateObject: View {
    var body: some View {
        ParentView()
    }
}

struct ParentView: View {
    @StateObject var childVM: ChildViewModel = .init()
    @State var toggle: Bool = false
    
    var body: some View {
        VStack {
            ChildView(vm: childVM, toggle: toggle)
            Button("hit me", action: { toggle = !toggle })
        }
        
    }
}

struct ChildView: View {
    @ObservedObject var vm: ChildViewModel
    var toggle: Bool
    
    var body: some View {
        HStack {
            Text(toggle ? "on" : "off")
            
            Button(action: { vm.count -= 1 }) {
                Text("-")
            }
            
            Text("\(vm.count)")
            
            Button(action: { vm.count += 1 }) {
                Text("+")
            }
        }
    }
}

class ChildViewModel: ObservableObject {
    @Published var count: Int = 0
}

struct ObservedObjectVSStateObject_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectVSStateObject()
    }
}
