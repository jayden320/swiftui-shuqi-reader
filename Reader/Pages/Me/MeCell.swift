//
//  MeCell.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/23.
//

import SwiftUI

struct MeCell: View {
    let title: String
    let iconName: String
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image(iconName)
                Text(title)
                Spacer()
                Image("arrow_right")
            }.padding(.horizontal).frame(height: Drawing.cellHeight)
            Divider().padding(.leading, 50)
        }
    }
    
    private struct Drawing {
        static let cellHeight = 50.0
    }
}











struct MeCell_Previews: PreviewProvider {
    static var previews: some View {
        MeCell(title: "钱包", iconName: "me_wallet")
    }
}
