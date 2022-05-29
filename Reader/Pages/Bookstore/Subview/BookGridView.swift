//
//  BookGridView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookGridView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    let books: [Book]
    
    var body: some View {
        let items = Array(repeating: GridItem(), count: horizontalSizeClass == .compact ? 4 : 8)
        LazyVGrid(columns: items, spacing: 15) {
            ForEach(books) { book in
                BookVItemView(book: book)
            }
        }.padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}


