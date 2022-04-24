//
//  TopBarView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct TopBarView: View {
    let titles: [String]
    @Binding var selection: Int
    
    @ViewBuilder
    func itemView(title: String, index: Int) -> some View {
        let isSelected = (index == selection)
        Button {
            selection = index
        } label: {
            VStack(spacing: 5.0) {
                Text(title).font(.title3).foregroundColor(isSelected ? ThemeColor.darkGray : ThemeColor.gray)
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 20, height: 4)
                    .foregroundColor(ThemeColor.secondary)
                    .opacity(isSelected ? 1 : 0)
            }.frame(maxWidth:.infinity)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BlurView(blurEffect: UIBlurEffect(style: .extraLight)).frame(height: Screen.navigationBarHeight)
            HStack {
                Spacer().frame(maxWidth:.infinity)
                ForEach(0..<titles.count, id: \.self) { idx in
                    itemView(title: titles[idx], index: idx)
                }
                Spacer().frame(maxWidth:.infinity)
            }.padding(.bottom, 5)
        }
    }
}
