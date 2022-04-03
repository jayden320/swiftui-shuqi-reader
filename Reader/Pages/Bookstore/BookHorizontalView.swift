//
//  BookHorizontalView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct BookHorizontalView: View {
    let books: [Book]
    
    var body: some View {
        LazyVStack {
            ForEach(books) { book in
                BookHLargeItemView(book: book)
            }
        }.padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}
