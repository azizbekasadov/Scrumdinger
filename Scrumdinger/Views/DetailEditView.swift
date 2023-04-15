//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Azizbek Asadov on 15/04/23.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
//    The Form container automatically adapts the appearance of controls when it renders on different platforms.
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length") // accessibility purposes
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New attendee", text: $newAttendeeName)
                        .onSubmit {
                            addNewAttendee()
                        }
                        .accessibilityHidden(true)
                    Button(action: {
                        addNewAttendee()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityHidden(true)
                    }
                    .disabled(newAttendeeName.isEmpty)
                    .accessibilityHidden(true)
                }
                .accessibilityLabel("Add attendee")
            }
        }
    }
    
    private func addNewAttendee() {
        withAnimation {
            let attendee = DailyScrum.Attendee(name: newAttendeeName)
            scrum.attendees.append(attendee)
            newAttendeeName = ""
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
