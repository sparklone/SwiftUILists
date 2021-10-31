//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Element: Identifiable {
    var id: UUID = UUID()
    var name: String
}

struct ListFromVar: View {
    @State private var elements: [Element] = [
        .init(name: "First"),
        .init(name: "Second"),
        .init(name: "First")
    ]
    var body: some View {
        List(elements) { element in
            Text(element.name)
        }
    }
}

PlaygroundPage.current.setLiveView(ListFromVar())
