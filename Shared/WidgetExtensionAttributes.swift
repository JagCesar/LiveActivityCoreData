//
//  WidgetExtensionAttributes.swift
//  CoreDataExample
//
//  Created by César Pinto Castillo on 2023-07-25.
//

import Foundation
import ActivityKit

struct WidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}
