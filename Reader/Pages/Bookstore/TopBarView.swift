//
//  TopBarView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct TopBarView: View {
    let titles: [String]
    var selection: Binding<Int>
    
    @ViewBuilder
    func itemView(title: String, index: Int) -> some View {
        let isSelected = (index == selection.wrappedValue)
        VStack(spacing: 5.0) {
            Text(title).font(.title3).foregroundColor(isSelected ? ThemeColor.darkGray : ThemeColor.gray)
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 20, height: 4)
                .foregroundColor(ThemeColor.secondary)
                .opacity(isSelected ? 1 : 0)
        }.frame(maxWidth:.infinity).onTapGesture {
            
        }
    }
    
    var body: some View {
        HStack {
            Spacer().frame(maxWidth:.infinity)
            ForEach(0..<titles.count, id: \.self) { idx in
                itemView(title: titles[idx], index: idx)
            }
            Spacer().frame(maxWidth:.infinity)
        }
    }
}
