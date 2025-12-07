import SwiftUI

struct BecomeWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.text)
            .font(.body)
            .padding()
    }
}
