//
//  widgetExtensionBundle.swift
//  widgetExtension
//
//  Created by César Pinto Castillo on 2023-07-25.
//

import WidgetKit
import SwiftUI

@main
struct widgetExtensionBundle: WidgetBundle {
    let persistenceController = PersistenceController.shared
    
    var body: some Widget {
        widgetExtension()
        widgetExtensionLiveActivity()
    }
}
