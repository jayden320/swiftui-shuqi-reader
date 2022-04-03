//
//  SectionHeader.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5).frame(width: 3, height: 20).foregroundColor(ThemeColor.secondary)
            Text(title).font(.bold(.title3)())
        }
        .padding(.leading)
    }
}









































struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(title: "Hello")
    }
}
