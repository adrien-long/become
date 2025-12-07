import Foundation
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> TextEntry {
        TextEntry(date: Date(), text: "Loading…")
    }

    func getSnapshot(in context: Context, completion: @escaping (TextEntry) -> Void) {
        completion(TextEntry(date: Date(), text: "Preview"))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<TextEntry>) -> Void) {
        let userDefaults = UserDefaults(suiteName: "group.com.mycompany.become.widgetgroup")
        let list = userDefaults?.stringArray(forKey: "textList") ?? ["No data"]

        var entries: [TextEntry] = []
        let currentDate = Date()

        for offset in stride(from: 0, through: 24, by: 4) {
            let entryDate = Calendar.current.date(byAdding: .hour, value: offset, to: currentDate)!

            let entry = TextEntry(
                date: entryDate,
                text: list.randomElement() ?? "No data"
            )

            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
