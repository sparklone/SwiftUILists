//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ConstantList: View {
    var body: some View {
        List {
            Text("First")
            Text("Second")
        }
    }
}

PlaygroundPage.current.setLiveView(ConstantList())
