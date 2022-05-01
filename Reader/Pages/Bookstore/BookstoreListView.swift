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
                    }.tabViewStyle(PageTabViewStyle()).aspectRatio(Drawing.carouselAspect, contentMode: .fill)
                }
                if let menus = viewModel.menus {
                    BookstoreMenuView(menus: menus)
                }
                Spacer(minLength: Drawing.sectionHeight)
                
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
                    Spacer(minLength: Drawing.sectionHeight)
                }.foregroundColor(ThemeColor.darkGray)
            }.padding(EdgeInsets(top: Screen.safeAreaInsets.top, leading: 0, bottom: Drawing.tabBarHeight, trailing: 0))
        }.background(ThemeColor.card)
    }
    
    var body: some View {
        Group {
            if viewModel.fetchStatus == .fetching {
                ProgressView()
            } else {
                content
            }
        }.onAppear {
            if viewModel.cards.isEmpty {
                Task { await viewModel.fetchData() }
            }
        }
    }
    
    private struct Drawing {
        static let carouselAspect: CGFloat = 5/3
        static let tabBarHeight = 50.0
        static let sectionHeight = 20.0
    }
}
