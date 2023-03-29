//
//  CardView.swift
//  Scrumdinger
//
//  Created by Azizbek Asadov on 29/03/23.

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
//            This modifier helps convey the information architecture of the view by reading the scrum title, followed by “heading.”
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: Constants.Images.person)
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: Constants.Images.clock)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
    
    private enum Constants {
        enum Images {
            static let person = "person.3"
            static let clock = "clock"
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static let sampleData = DailyScrum.sampleData.randomElement()!
    
    static var previews: some View {
        CardView(scrum: sampleData)
            .background(sampleData.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
