//
//  BookshelfPage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookshelfPage: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel: BookshelfViewModel
    
    var header: some View {
        return ZStack(alignment: .topLeading) {
            if colorScheme == .light {
                Group {
                   Image("bookshelf_bg").resizable()
                   Image("bookshelf_cloud_0").resizable()
                }.scaledToFill().frame(height: 300, alignment: .bottom)
            }
            VStack {
                HStack {
                    Spacer()
                    Button {} label: {
                        Image("actionbar_checkin")
                    }.padding(.trailing)
                    Button {} label: {
                        Image("actionbar_search")
                    }.padding(.trailing)
                }
                
                firstBook
            }.padding(.top, Screen.safeAreaInsets.top)
        }
    }
    
    @ViewBuilder
    var firstBook: some View {
        if let book = viewModel.books.first {
            HStack {
                BookCover(url: book.imgUrl, width: 120)
                VStack(alignment: .leading, spacing: 30) {
                    Text(book.name).font(.title)
                    HStack {
                        Text("读至0.2%")
                        Text("继续阅读")
                        Image("bookshelf_continue_read")
                    }
                }.foregroundColor(Color.white)
                .padding(.leading, 10.0)
                Spacer()
            }.padding(.leading)
        }
    }
    
    @ViewBuilder
    var gridView: some View {
        let books = viewModel.books
        if books.count <= 1 {
             Spacer()
        } else {
            LazyVGrid(columns: [GridItem(spacing: 15), GridItem(spacing: 15), GridItem(spacing: 15)], spacing: 15) {
                 ForEach(books.dropFirst()) { book in
                    BookVItemView(book: book)
                }
             }.padding()
        }
    
    }
    
    var content: some View {
        ScrollView {
            LazyVStack {
                header
                gridView
            }.padding(.bottom, Screen.tabbarHeight)
        }.background(ThemeColor.card).ignoresSafeArea()
    }
    
    var body: some View {
        Group {
            if viewModel.fetchStatus == .fetching {
                ProgressView()
            } else {
                content
            }
        }
    }
}



































































struct BookshelfPage_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfPage(viewModel: BookshelfViewModel.mock()).preferredColorScheme(.dark)
    }
}
