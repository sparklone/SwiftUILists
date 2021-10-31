//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Element: Identifiable {
    var id: UUID = UUID()
    var name: String
}

struct ListForEach: View {
    @State private var elements: [Element] = [
        .init(name: "First"),
        .init(name: "Second"),
        .init(name: "First")
    ]
    var body: some View {
        List {
            ForEach(elements) { element in
                Text(element.name)
            }
            .onDelete { indexSet in
                elements.remove(atOffsets: indexSet)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ListForEach())
