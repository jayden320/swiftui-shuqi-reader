//
//  BookView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookVItemView: View {
    let book: Book
    
    var body: some View {
        NavigationLink(destination: BookDetailPage()) {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: book.imgUrl)).resizable().aspectRatio(3/4, contentMode: .fill)
                Text(book.name).font(.bold(.body)()).lineLimit(1).foregroundColor(ThemeColor.darkGray)
                Spacer(minLength: 5)
                Text(book.author).font(.caption).foregroundColor(ThemeColor.gray)
            }
        }
    }
}

struct BookHItemView: View {
    let book: Book
    
    var body: some View {
        NavigationLink(destination: BookDetailPage()) {
            HStack {
                WebImage(url: URL(string: book.imgUrl)).resizable().aspectRatio(3/4, contentMode: .fill).frame(width: 60)
                VStack(alignment: .leading) {
                    Text(book.name).font(.bold(.body)()).lineLimit(2).multilineTextAlignment(.leading)
                    Spacer(minLength: 5)
                    Text("\(book.recommendCount.countDescription)人推荐").font(.caption).foregroundColor(ThemeColor.gray)
                }
                Spacer()
            }
        }
    }
}

struct BookCell: View {
    let book: Book
    
    var body: some View {
        NavigationLink(destination: BookDetailPage()) {
            HStack() {
                WebImage(url: URL(string: book.imgUrl)).resizable().aspectRatio(3/4, contentMode: .fill).frame(width: 70).clipped()
                VStack(alignment: .leading) {
                    Text(book.name).font(.bold(.body)()).lineLimit(2)
                    Spacer(minLength: 3)
                    Text(book.introduction ?? "").font(.subheadline).foregroundColor(ThemeColor.gray).lineLimit(2)
                    Spacer(minLength: 3)
                    HStack {
                        Text(book.author).font(.caption).foregroundColor(ThemeColor.gray)
                        Spacer()
                        buildTag(title: book.status, color: book.status == "连载" ? ThemeColor.blue : ThemeColor.primary)
                        buildTag(title: book.type, color: ThemeColor.gray)
                    }
                }
                Spacer()
            }.padding(.vertical, 3)
        }
    }
    
    func buildTag(title: String, color: Color) -> some View {
        Text(title).font(.caption).foregroundColor(color).padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)).border(color.opacity(0.3))
    }
}




struct BookCell_Previews: PreviewProvider {
    static var previews: some View {
        BookCell(book: Book.mock(id: "0"))
            .previewLayout(.fixed(width: 375, height: 100))
//        BookstorePage().preferredColorScheme(.dark)
    }
}
