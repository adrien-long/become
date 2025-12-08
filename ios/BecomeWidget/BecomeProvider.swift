import Foundation
import WidgetKit
import os

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> TextEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (TextEntry) -> Void) {
        if context.isPreview {
                    completion(.previewPlaceholder)
                } else {
                    completion(.placeholder)
                }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<TextEntry>) -> Void) {
        let userDefaults = UserDefaults(suiteName: "group.com.mycompany.become.widgetgroup")
        let jsonString = userDefaults?.string(forKey: "textList") ?? "[]"
        debugPrint("Raw jsonString: \(jsonString)")

        // Use os.Logger and ensure we log after decoding
        let logger = os.Logger(subsystem: "com.mycompany.become", category: "Widget")

        let texts: [String]
        do {
            texts = try JSONDecoder().decode([String].self, from: Data(jsonString.utf8))
        } catch {
            os.Logger(subsystem: "com.mycompany.become", category: "Widget")
                .error("Failed to decode textList: \(error.localizedDescription, privacy: .public)")
            texts = []
        }
        logger.info("Raw jsonString: \(jsonString)")
        logger.info("Decoded texts: \(texts, privacy: .public)")

        var entries: [TextEntry] = []
        let currentDate = Date()

        for offset in stride(from: 0, through: 24, by: 4) {
            let entryDate = Calendar.current.date(byAdding: .hour, value: offset, to: currentDate)!

            let entry = TextEntry(
                date: entryDate,
                text: texts.randomElement() ?? "No data member"
            )

            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

extension TextEntry {
    static var placeholder: TextEntry {
        TextEntry(
            date: Date(),
            text: "Placeholder",
        )
    }
    
    static var previewPlaceholder: TextEntry {
        TextEntry(
            date: Date(),
            text: "previewPlaceholder",
        )
    }
}
