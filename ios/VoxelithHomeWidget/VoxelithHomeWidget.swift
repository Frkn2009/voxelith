import SwiftUI
import WidgetKit

private let appGroup = "group.com.voxelith.voxelith"

struct VoxelithEntry: TimelineEntry {
    let date: Date
    let lesson: String
    let dailyXp: Int
    let goal: Int
    let streak: Int
    let streakText: String
}

struct VoxelithProvider: TimelineProvider {
    func placeholder(in context: Context) -> VoxelithEntry {
        VoxelithEntry(date: Date(), lesson: "VOXELITH", dailyXp: 40, goal: 100, streak: 3, streakText: "🔥 3")
    }

    func getSnapshot(in context: Context, completion: @escaping (VoxelithEntry) -> Void) {
        completion(entry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<VoxelithEntry>) -> Void) {
        completion(Timeline(entries: [entry()], policy: .after(Date().addingTimeInterval(3600))))
    }

    private func entry() -> VoxelithEntry {
        let data = UserDefaults(suiteName: appGroup)
        let streak = data?.integer(forKey: "streak") ?? 0
        return VoxelithEntry(
            date: Date(),
            lesson: data?.string(forKey: "lesson") ?? "VOXELITH",
            dailyXp: data?.integer(forKey: "daily_xp") ?? 0,
            goal: data?.integer(forKey: "goal") ?? 100,
            streak: streak,
            streakText: data?.string(forKey: "streak_text") ?? "🔥 \(streak)"
        )
    }
}

struct VoxelithWidgetView: View {
    let entry: VoxelithEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("VOXELITH").font(.caption.bold()).tracking(2).foregroundStyle(Color(red: 0.88, green: 0.95, blue: 0.94))
            Spacer()
            Text(entry.lesson).font(.headline).foregroundStyle(.white).lineLimit(2)
            HStack {
                Text("\(entry.dailyXp) / \(entry.goal) XP").font(.caption.bold()).foregroundStyle(Color(red: 0.94, green: 0.70, blue: 0.56))
                Spacer()
                Text(entry.streakText).font(.caption).foregroundStyle(.white)
            }
        }
        .padding()
        .containerBackground(Color(red: 0.05, green: 0.35, blue: 0.33), for: .widget)
        .widgetURL(URL(string: "voxelith://app"))
    }
}

@main
struct VoxelithHomeWidget: Widget {
    let kind = "VoxelithHomeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: VoxelithProvider()) { entry in
            VoxelithWidgetView(entry: entry)
        }
        .configurationDisplayName("VOXELITH")
        .description("Daily lesson, XP goal and streak.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
