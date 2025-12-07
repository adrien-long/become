import WidgetKit
import SwiftUI

@main
struct BecomeWidgetBundle: WidgetBundle {
    var body: some Widget {
        BecomeWidget()
    }
}

#Preview(as: .systemSmall) {
    BecomeWidget()
} timeline: {
    TextEntry(date: .now, text: "Test1")
    TextEntry(date: .now, text: "Test2")
}
