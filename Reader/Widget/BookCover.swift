//
//  BookCover.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookCover: View {
    let url: String
    var width: Double?
    
    var body: some View {
        let image = WebImage(url: URL(string: url)).resizable().aspectRatio(3/4, contentMode: .fit).clipped()
        if let width = width {
            image.frame(width: width)
        } else {
            image
        }
    }
}

struct BookCover_Previews: PreviewProvider {
    static var previews: some View {
        BookCover(url: "http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg", width: 170)
    }
}
