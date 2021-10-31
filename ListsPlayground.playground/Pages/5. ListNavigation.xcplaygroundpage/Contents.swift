//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Element: Identifiable {
    var id: UUID = UUID()
    var name: String
}

struct ListElement: View {
    let element: Element

    var body: some View {
        Text(element.name)
            .foregroundColor(.red)
    }
}

struct ListForEach: View {
    @State private var elements: [Element] = [
        .init(name: "First"),
        .init(name: "Second"),
        .init(name: "First")
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(elements) { element in
                    NavigationLink(destination: ListElement(element: element)) {
                        Text(element.name)
                    }
                }
                .onDelete { indexSet in
                    elements.remove(atOffsets: indexSet)
                }
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ListForEach())
