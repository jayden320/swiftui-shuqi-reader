//
//  MePage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct MePage: View {
    
    var body: some View {
        ScrollView {
            LazyVStack {
                MeHeader()
                Group {
                    MeCell(title: "钱包", iconName: "me_wallet")
                    MeCell(title: "消费充值记录", iconName: "me_record")
                    MeCell(title: "购买的书", iconName: "me_buy")
                    MeCell(title: "我的会员", iconName: "me_vip")
                    MeCell(title: "绑兑换码", iconName: "me_coupon")
                    MeCell(title: "阅读之约", iconName: "me_date")
                }
                Group {
                    MeCell(title: "我的收藏", iconName: "me_favorite")
                    MeCell(title: "打赏记录", iconName: "me_record")
                    MeCell(title: "我的书评", iconName: "me_comment")
                    MeCell(title: "个性换肤", iconName: "me_theme")
                    MeCell(title: "设置", iconName: "me_setting")
                    MeCell(title: "Github", iconName: "me_feedback").onTapGesture {
                        UIApplication.shared.open(URL(string: "https://github.com/huanxsd/swiftui-shuqi-reader")!)
                    }
                                                     
                }
            }
        }.padding(EdgeInsets(top: Screen.safeAreaInsets.top, leading: 0, bottom: Screen.tabbarHeight, trailing: 0)).ignoresSafeArea()
    }
}



































































struct MePage_Previews: PreviewProvider {
    static var previews: some View {
        MePage()
    }
}
