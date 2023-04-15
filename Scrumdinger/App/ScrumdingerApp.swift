//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Azizbek Asadov on 29/03/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
