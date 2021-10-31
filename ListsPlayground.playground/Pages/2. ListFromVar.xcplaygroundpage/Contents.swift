//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Element {
    var name: String
}

struct ListFromVar: View {
    @State private var elements: [Element] = [
        .init(name: "First"),
        .init(name: "Second")
    ]
    var body: some View {
        List(elements, id: \.name) { element in
            Text(element.name)
        }
    }
}

PlaygroundPage.current.setLiveView(ListFromVar())
