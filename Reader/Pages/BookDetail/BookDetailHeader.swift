//
//  BookDetailHeader.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookDetailHeader: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    var book: BookDetail
    
    var stars: some View {
        ForEach(0..<Int(ceil(book.score)), id: \.self) { score in
            if Int(book.score) > score {
                Image("detail_star")
            } else {
                Image("detail_star_half")
            }
        }
    }
    
    var info: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(book.author)
            Text("\(book.wordCount.toStringAsFixed(2))万字  \(book.price.toStringAsFixed(1))书豆/千字")
            HStack {
                Text("评分：\(book.score.toStringAsFixed(1))分")
                stars
            }
            HStack(spacing: 0) {
                Image("read_icon_vip")
                Text(" 包月会员，万本小说免费读 >").foregroundColor(ThemeColor.orange)
            }
        }.font(.subheadline)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HStack {
                BookCover(url: book.imgUrl, width: 80)
                info
            }.padding().padding(.top, Screen.safeAreaInsets.top + 44)
        }
    }
}








struct BookDetailHeader_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailHeader(book: BookDetail.mock()).previewLayout(.fixed(width: 375, height: 400))
    }
}
