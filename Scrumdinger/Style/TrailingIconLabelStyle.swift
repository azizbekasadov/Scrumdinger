//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Azizbek Asadov on 29/03/23.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
//    The configuration parameter is a LabelStyleConfiguration,
//    which contains the icon and title views. These views represent the label’s image and label text.
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
