//
//  BookstoreMenuView.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct BookstoreMenuView: View {
    let menus: [Menu]
    
    var body: some View {
        HStack {
            ForEach(menus, id: \.title) { menu in
                VStack(spacing: 0) {
                    Image(menu.imageName)
                    Text(menu.title).font(.body).foregroundColor(.gray)
                }.frame(maxWidth: .infinity)
            }
        }
    }
}
