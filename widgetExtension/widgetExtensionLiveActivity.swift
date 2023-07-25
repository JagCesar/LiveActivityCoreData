//
//  widgetExtensionLiveActivity.swift
//  widgetExtension
//
//  Created by César Pinto Castillo on 2023-07-25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct widgetExtensionLiveActivity: Widget {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetExtensionAttributes.self) { context in
            // Lock screen/banner UI goes here

            ForEach(items) { item in
                Text(item.timestamp!.debugDescription)
            }

            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetExtensionAttributes {
    fileprivate static var preview: WidgetExtensionAttributes {
        WidgetExtensionAttributes(name: "World")
    }
}

extension WidgetExtensionAttributes.ContentState {
    fileprivate static var smiley: WidgetExtensionAttributes.ContentState {
        WidgetExtensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetExtensionAttributes.ContentState {
         WidgetExtensionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetExtensionAttributes.preview) {
   widgetExtensionLiveActivity()
} contentStates: {
    WidgetExtensionAttributes.ContentState.smiley
    WidgetExtensionAttributes.ContentState.starEyes
}
