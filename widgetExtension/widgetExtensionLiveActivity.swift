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
    let persistenceController = PersistenceController.shared

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetExtensionAttributes.self) { context in
            LiveActivityView(context: context)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
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
