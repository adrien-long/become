import SwiftUI
import WidgetKit

struct BecomeWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.text)
            .font(.body)
            .padding(4)
            .containerBackground(for: .widget) {
                Color.clear
            }
    }
}
