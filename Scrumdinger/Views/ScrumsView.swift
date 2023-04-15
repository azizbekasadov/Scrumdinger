//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Azizbek Asadov on 30/03/23.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add New Scrum")
            }
        }
        
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static let scrums = DailyScrum.sampleData
    
    static var previews: some View {
        ScrumsView(scrums: .constant(scrums))
    }
}
