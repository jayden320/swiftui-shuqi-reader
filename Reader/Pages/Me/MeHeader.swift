//
//  MeHeader.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/23.
//

import SwiftUI

struct MeHeader: View {
    var body: some View {
        HStack {
            ZStack {
                Image("placeholder_avatar")
                RoundedRectangle(cornerRadius: Drawing.radius).strokeBorder().foregroundColor(ThemeColor.blue.opacity(0.5))
            }.frame(width: Drawing.radius * 2, height: Drawing.radius * 2, alignment: .center)
            
            Spacer(minLength: 20)
            VStack(alignment: .leading, spacing: 10) {
                Text("登录")
                HStack {
                    buildItem(title: "书豆余额", value: "0.0")
                    Spacer()
                    buildItem(title: "书券（张）", value: "0")
                    Spacer()
                    buildItem(title: "月票", value: "0")
                    Spacer()
                }
            }
        }.padding(.all, 20)
    }
    
    private func buildItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(value).bold()
            Text(title).font(.caption).foregroundColor(ThemeColor.gray)
        }
    }
    
    private struct Drawing {
        static let radius = 30.0
    }
}








struct MeHeader_Previews: PreviewProvider {
    static var previews: some View {
        MeHeader()
    }
}
