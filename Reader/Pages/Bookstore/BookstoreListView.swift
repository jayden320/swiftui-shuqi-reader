//
//  BookstoreListView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookstoreListView: View {
    var viewModel: BookstoreViewModel
    
    var body: some View {
        if let model = viewModel.model {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    WebImage(url: URL(string: "http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg")).resizable().scaledToFit()
                    BookstoreMenuView(menus: model.menus)
                    Spacer(minLength: 20)
                    
                    ForEach(model.cards, id: \.title) { card in
                        SectionHeader(title: card.title)
                        switch card.style {
                        case .grid:
                            BookGridView(books: card.books)
                        case .hybird:
                            BookHybirdView(books: card.books)
                        case .cell:
                            BookHorizontalView(books: card.books)
                        }
                        Spacer(minLength: 20)
                    }
                }
            }
        } else {
            ProgressView()
        }
    }
}
