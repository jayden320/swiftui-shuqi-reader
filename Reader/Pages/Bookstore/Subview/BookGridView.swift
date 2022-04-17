//
//  BookGridView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookGridView: View {
    let books: [Book]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()], spacing: 15) {
            ForEach(books) { book in
                BookVItemView(book: book)
            }
        }.padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}


