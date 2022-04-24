//
//  ReaderTopMenuPanel.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import SwiftUI

struct ReaderTopMenuPanel: View {
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

        }.foregroundColor(ThemeColor.darkGray).padding().padding(.top, Screen.safeAreaInsets.top).background(ThemeColor.card)
    }
}















struct ReaderTopMenuPanel_Previews: PreviewProvider {
    static var previews: some View {
        ReaderTopMenuPanel()
    }
}
