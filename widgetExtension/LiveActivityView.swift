//
//  LiveActivityView.swift
//  widgetExtensionExtension
//
//  Created by César Pinto Castillo on 2023-07-25.
//

import Foundation
import SwiftUI
import WidgetKit

struct LiveActivityView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    let context: ActivityViewContext<WidgetExtensionAttributes>

    var body: some View {
        ForEach(items) { item in
            Text(item.timestamp!.debugDescription)
        }

        VStack {
            Text("Hello \(context.state.emoji)")
        }
        .activityBackgroundTint(Color.cyan)
        .activitySystemActionForegroundColor(Color.black)
    }
}
