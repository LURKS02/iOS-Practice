//
//  TextFieldExample.swift
//  SwiftUIPractice
//
//  Created by 디해 on 2023/02/27.
//

import SwiftUI
import Combine

struct TextFieldExample: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        TextField("gd", text: $vm.text)
    }
}

extension TextFieldExample {
    class ViewModel: ObservableObject {
        @Published var text: String = ""
        var cancel = Set<AnyCancellable>()
        
        init() {
            subscribeRemoveSpace()
        }
        
        func subscribeRemoveSpace() {
            $text  //publisher
                .filter { $0.count < 10 }
                .map { $0.uppercased() }
                .receive(on: DispatchQueue.main)
                .sink { [weak self] newText in //newtext: output
                    self?.text = newText
                    .components(separatedBy: " ").joined()
                }
                .store(in: &cancel) //subscriber
        }
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}
