//
//  ReaderApp.swift
//  Reader
//
//  Created by Jayden Liu on 2022/3/24.
//

import SwiftUI

@main
struct ReaderApp: App {
    var body: some Scene {
        WindowGroup {
            TabPage().onAppear(perform: setupAppearance)
        }
    }
    
    func setupAppearance() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
}
