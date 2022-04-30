//
//  TabPage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import Introspect

struct TabPage: View {
    @State private var tabBarIndex = NavigationCoordinator.shared.tabBarIndex
    
    static let tabItemInfos = [
        TabItemInfo(title: "书架",
                    imageName: "tab_bookshelf_n",
                    selectedImageName: "tab_bookshelf_p",
                    navigationBarHidden: true),
        TabItemInfo(title: "书城",
                    imageName: "tab_bookstore_n",
                    selectedImageName: "tab_bookstore_p",
                    navigationBarHidden: true),
        TabItemInfo(title: "我的",
                    imageName: "tab_me_n",
                    selectedImageName: "tab_me_p",
                    navigationBarHidden: true)
    ]
    
    var body: some View {
        NavigationView() {
            TabView(selection: $tabBarIndex) {
                BookshelfPage(viewModel: BookshelfViewModel()).tabItem { createTabItem(TabPage.tabItemInfos[0]) }.tag(0)
                BookstorePage().tabItem { createTabItem(TabPage.tabItemInfos[1]) }.tag(1)
                MePage().tabItem { createTabItem(TabPage.tabItemInfos[2]) }.tag(2)
            }.navigationBarTitleDisplayMode(.inline).introspectNavigationController { (navigationController) in
                navigationController.navigationBar.isHidden = true
                navigationController.delegate = NavigationCoordinator.shared
                NavigationCoordinator.shared.mainNavigationController = navigationController
            }.onChange(of: tabBarIndex) { newValue in
                print("On tap tab bar item \(newValue)")
                NavigationCoordinator.shared.tabBarIndex = newValue
            }
        }
    }
    
    @ViewBuilder
    func createTabItem(_ info: TabItemInfo) -> some View {
        let isSelected = TabPage.tabItemInfos.firstIndex { $0 == info } == tabBarIndex
        if isSelected {
            Image(info.selectedImageName)
        } else {
            Image(info.imageName).renderingMode(.template).foregroundColor(ThemeColor.gray)
        }
        Text(info.title)
    }
}

struct TabItemInfo: Equatable {
    let title: String
    let imageName: String
    let selectedImageName: String
    let navigationBarHidden: Bool
}

class NavigationCoordinator: NSObject, UINavigationControllerDelegate {
    static let shared = NavigationCoordinator()
    
    weak var mainNavigationController: UINavigationController?
    
    var tabBarIndex = 1 {
        didSet {
            mainNavigationController?.navigationBar.isHidden = TabPage.tabItemInfos[tabBarIndex].navigationBarHidden
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        
        if navigationController.viewControllers.count == 1 {
            navigationController.navigationBar.isHidden = TabPage.tabItemInfos[tabBarIndex].navigationBarHidden
        } else {
            navigationController.navigationBar.isHidden = false
        }
    }
}



































































struct TabPage_Previews: PreviewProvider {
    static var previews: some View {
        TabPage()
    }
}

