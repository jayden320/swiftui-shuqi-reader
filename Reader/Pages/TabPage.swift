//
//  TabPage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct TabPage: View {
    @State private var tabBarIndex = 1
    
    let tabItemInfos = [
        TabItemInfo(title: "书架", imageName: "tab_bookshelf_n", selectedImageName: "tab_bookshelf_p"),
        TabItemInfo(title: "书城", imageName: "tab_bookstore_n", selectedImageName: "tab_bookstore_p"),
        TabItemInfo(title: "我的", imageName: "tab_me_n", selectedImageName: "tab_me_p")
    ]
    
    var body: some View {
        TabView(selection: $tabBarIndex) {
            NavigationView { BookshelfPage() }.tabItem { createTabItem(tabItemInfos[0]) }.tag(0)
            NavigationView { BookstorePage() }.tabItem { createTabItem(tabItemInfos[1]) }.tag(1)
            NavigationView { MePage() }.tabItem { createTabItem(tabItemInfos[2]) }.tag(2)
        }
    }
    
    @ViewBuilder
    func createTabItem(_ info: TabItemInfo) -> some View {
        let isSelected = tabItemInfos.firstIndex { $0 == info } == tabBarIndex
        
        Image(isSelected ? info.selectedImageName : info.imageName)
        Text(info.title)
    }
}

struct TabItemInfo: Equatable {
    let title: String
    let imageName: String
    let selectedImageName: String
}



































































struct TabPage_Previews: PreviewProvider {
    static var previews: some View {
        TabPage()
    }
}

