import WidgetKit
import SwiftUI

struct BecomeWidget: Widget {
    let kind: String = "BecomeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            BecomeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Become Widget")
        .description("You got this.")
        .supportedFamilies([.accessoryRectangular, .systemSmall, .systemMedium])
    }
}
