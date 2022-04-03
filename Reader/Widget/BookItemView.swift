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
        VStack(alignment: .leading) {
            WebImage(url: URL(string: book.imgUrl)).resizable().aspectRatio(3/4, contentMode: .fill)
            Text(book.name).font(.bold(.body)()).lineLimit(1)
            Spacer(minLength: 5)
            Text(book.author).font(.caption).foregroundColor(ThemeColor.gray)
        }
    }
}

struct BookHItemView: View {
    let book: Book
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: book.imgUrl)).resizable().aspectRatio(3/4, contentMode: .fill).frame(width: 60)
            VStack(alignment: .leading) {
                Spacer()
                Text(book.name + book.name).font(.bold(.body)()).lineLimit(2)
                Spacer(minLength: 5)
                Text("\(book.recommendCount.countDescription)人推荐").font(.caption).foregroundColor(ThemeColor.gray)
                Spacer()
            }
        }
    }
}

struct BookHLargeItemView: View {
    let book: Book
    
    var body: some View {
        HStack() {
            WebImage(url: URL(string: book.imgUrl)).resizable().aspectRatio(3/4, contentMode: .fill).frame(width: 70).clipped()
            VStack(alignment: .leading) {
                Text(book.name + book.name).font(.bold(.body)()).lineLimit(2)
                Spacer(minLength: 3)
                Text(book.introduction ?? "").font(.subheadline).foregroundColor(ThemeColor.gray).lineLimit(2)
                Spacer(minLength: 3)
                Text(book.author).font(.caption).foregroundColor(ThemeColor.gray)
            }
        }.padding(.vertical, 3)
    }
}
