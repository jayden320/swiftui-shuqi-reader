//
//  BookshelfPage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookshelfPage: View {
    @ObservedObject var viewModel: BookshelfViewModel
//    @StateObject var viewModel: BookshelfViewModel = BookshelfViewModel()
    
    var header: some View {
        return ZStack(alignment: .topLeading) {
            Group {
                Image("bookshelf_bg").resizable()
                Image("bookshelf_cloud_0").resizable()
            }.scaledToFill().frame(height: 300, alignment: .bottom)
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
            }
        }
    }
    
    @ViewBuilder
    var firstBook: some View {
        if let book = viewModel.books.first {
            HStack {
                WebImage(url: URL(string: book.imgUrl)).resizable().aspectRatio(3/4, contentMode: .fit).frame(width: 120)
                VStack(alignment: .leading, spacing: 30) {
                    Text(book.name).foregroundColor(Color.white).font(.title)
                    HStack {
                        Text("读至0.2%")
                        Text("继续阅读")
                        Image("bookshelf_continue_read")
                    }.foregroundColor(Color.white)
                }
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
            }
        }.navigationBarHidden(true)
    }
    
    var body: some View {
        if viewModel.fetchStatus == .fetching {
            ProgressView()
        } else {
            content
        }
    }
}



































































struct BookshelfPage_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfPage(viewModel: BookshelfViewModel.mock())
    }
}
