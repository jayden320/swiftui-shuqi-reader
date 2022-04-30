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
            if isMenuVisible { ReaderTopMenuPanel().transition(.offset(x: 0, y: -Screen.navigationBarHeight)) }
            Spacer()
            if isMenuVisible { ReaderBottomMenuPanel(progress: $vm.progress).transition(.offset(x: 0, y: Drawing.bottomMenuOffset + Screen.safeAreaInsets.bottom)) }
        }.ignoresSafeArea()
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Text(article.title).foregroundColor(ThemeColor.gray).font(.subheadline)
            ScrollView {
                VStack(alignment: .leading) {
                    Text(article.title).font(.largeTitle).padding(.vertical, Drawing.titleVerticalPadding)
                    Text(article.content)
                }.foregroundColor(ThemeColor.darkGray)
            }
            ReaderBottomView(vm: vm)
        }.padding()
    }
    
    var main: some View {
        ZStack {
            if colorScheme == .light {
                Image("read_bg").resizable().ignoresSafeArea()
            }
            content
            menuPanel
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
                main
            }
        }.navigationBarHidden(true)
    }
    
    private struct Drawing {
        static let bottomMenuOffset = 130.0
        static let titleVerticalPadding = 30.0
    }
}

struct ReaderPage_Previews: PreviewProvider {
    static var previews: some View {
//        ReaderPage(vm: ReaderViewModel(bookId: "1"))
        ReaderPage(vm: ReaderViewModel(bookId: "1")).preferredColorScheme(.dark)
    }
}
