//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Azizbek Asadov on 29/03/23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: Constants.Images.hourGlassBottomImage)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: Constants.Images.hourGlassTopImage)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: Constants.Images.forwardWind)
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding()
    }
}

extension MeetingView {
    private enum Constants {
        enum Images {
            static let hourGlassBottomImage: String = "hourglass.bottomhalf.fill"
            static let hourGlassTopImage: String = "hourglass.tophalf.fill"
            static let forwardWind: String = "forward.fill"
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
