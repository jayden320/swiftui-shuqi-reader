//
//  BookstoreListView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookstoreListView: View {
    @ObservedObject var viewModel: BookstoreViewModel
    
    var content: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                if let carousels = viewModel.carousels {
                    TabView {
                        ForEach(carousels, id: \.imageUrl) { carousel in
                            WebImage(url: URL(string: carousel.imageUrl)).placeholder {
                                Rectangle().foregroundColor(ThemeColor.lightGray)
                            }.resizable()
                        }
                    }.tabViewStyle(PageTabViewStyle()).aspectRatio(5/3, contentMode: .fill)
                }
                if let menus = viewModel.menus {
                    BookstoreMenuView(menus: menus)
                }
                Spacer(minLength: 20)
                
                ForEach(viewModel.cards, id: \.title) { card in
                    SectionHeader(title: card.title)
                    switch card.style {
                    case .grid:
                        BookGridView(books: card.books)
                    case .hybird:
                        BookHybirdView(books: card.books)
                    case .cell:
                        BookHorizontalView(books: card.books)
                    case .unknow:
                        BookGridView(books: card.books)
                    }
                    Spacer(minLength: 20)
                }.foregroundColor(ThemeColor.darkGray)
            }.padding(EdgeInsets(top: Screen.safeAreaInsets.top, leading: 0, bottom: Screen.tabbarHeight, trailing: 0))
        }.ignoresSafeArea()
    }
    
    var body: some View {
        if viewModel.fetchStatus == .fetching {
            ProgressView()
        } else {
            content
        }
    }
}
