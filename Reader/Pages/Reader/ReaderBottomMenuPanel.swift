//
//  ReaderBottomMenuPanel.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import SwiftUI

struct ReaderBottomMenuPanel: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @Binding var progress: Double
    
    private func buildButton(title: String, iconName: String) -> some View {
        VStack {
            Image(iconName).renderingMode(.template)
            if verticalSizeClass == .regular {
                Text(title).font(.subheadline)
            }
        }.frame(maxWidth: .infinity)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {}) {
                    Image("read_icon_chapter_previous").renderingMode(.template)
                }
                Spacer(minLength: 30)
                Slider(value: $progress).accentColor(ThemeColor.primary)
                Spacer(minLength: 30)
                Button(action: {}) {
                    Image("read_icon_chapter_next").renderingMode(.template)
                }
            }
            HStack {
                buildButton(title: "目录", iconName: "read_icon_catalog")
                buildButton(title: "亮度", iconName: "read_icon_brightness")
                buildButton(title: "字体", iconName: "read_icon_font")
                buildButton(title: "设置", iconName: "read_icon_setting")
            }
        }
        .padding(Screen.horizontalSafeAreaInsets())
        .foregroundColor(ThemeColor.dimGray).padding().padding(.bottom, Screen.safeAreaInsets.bottom).background(ThemeColor.card)
    }
}






struct ReaderBottomMenuPanel_Previews: PreviewProvider {
    static var previews: some View {
        ReaderBottomMenuPanel(progress: .constant(1))
    }
}
