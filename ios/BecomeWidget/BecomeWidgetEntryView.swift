import SwiftUI
import WidgetKit

struct BecomeWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.text)
            .font(.body)
            .multilineTextAlignment(.center)
            .lineLimit(5)
            .minimumScaleFactor(0.7)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
            .containerBackground(for: .widget) {
                Color.clear
            }
    }
}
