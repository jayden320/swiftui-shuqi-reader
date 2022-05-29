//
//  ReaderTopMenuPanel.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import SwiftUI

struct ReaderTopMenuPanel: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image("pub_back_gray").renderingMode(.template)
            }

            Spacer()
            Button{} label: {
                Image("read_icon_voice").renderingMode(.template)
            }
            Button {} label: {
                Image("read_icon_more").renderingMode(.template)
            }
        }
        .padding(Screen.horizontalSafeAreaInsets(padding: Drawing.horizontalPadding))
        .frame(height: height)
        .foregroundColor(ThemeColor.darkGray).padding(.top, Screen.safeAreaInsets.top).background(ThemeColor.card)
    }
    
    var height: CGFloat {
        verticalSizeClass == .compact ? 44 : 50
    }
    
    private struct Drawing {
        static let horizontalPadding = 15.0
    }
}















struct ReaderTopMenuPanel_Previews: PreviewProvider {
    static var previews: some View {
        ReaderTopMenuPanel()
    }
}
