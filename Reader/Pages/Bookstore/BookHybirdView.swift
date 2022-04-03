//
//  BookHybirdView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct BookHybirdView: View {
    let books: [Book]
    
    var body: some View {
        LazyVStack {
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()], spacing: 15) {
                ForEach(0..<4,id: \.self) { idx in
                    BookVItemView(book: books[idx])
                }
            }
            LazyVGrid(columns: [GridItem(),GridItem()], spacing: 15) {
                ForEach(4..<books.count,id: \.self) { idx in
                    BookHItemView(book: books[idx])
                }
            }
        }.padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}
