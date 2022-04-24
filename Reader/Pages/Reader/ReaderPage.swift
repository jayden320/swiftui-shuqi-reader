//
//  ReaderPage.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import SwiftUI

struct ReaderPage: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var vm: ReaderViewModel
    
    @State var isMenuVisible = false

    var article: Article {
        vm.article!
    }
    
    var menuPanel: some View {
        VStack {
            ReaderTopMenuPanel()
            Spacer()
            ReaderBottomMenuPanel(progress: $vm.progress)
        }.ignoresSafeArea()
    }
    
    var content: some View {
        ZStack {
            if colorScheme == .light {
                Image("read_bg").resizable().ignoresSafeArea()
            }
            VStack(alignment: .leading) {
                Text(article.title).foregroundColor(ThemeColor.gray).font(.subheadline)
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        Text(article.title).font(.largeTitle).padding(.top, 30)
                        Text(article.content)
                    }.foregroundColor(ThemeColor.darkGray)
                }
                ReaderBottomView(vm: vm)
            }.padding()
            if isMenuVisible {
                menuPanel
            }
        }.onTapGesture {
            withAnimation {
                isMenuVisible = !isMenuVisible
            }
        }
    }
    
    var body: some View {
        Group {
            if vm.fetchStatus == .fetching {
                ProgressView()
            } else {
                content
            }
        }.navigationBarHidden(true)
    }
}

struct ReaderPage_Previews: PreviewProvider {
    static var previews: some View {
//        ReaderPage(vm: ReaderViewModel(bookId: "1"))
        ReaderPage(vm: ReaderViewModel(bookId: "1")).preferredColorScheme(.dark)
    }
}
