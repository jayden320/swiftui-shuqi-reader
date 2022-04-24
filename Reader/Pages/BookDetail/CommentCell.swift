//
//  CommentCell.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import SwiftUI

struct CommentCell: View {
    let comment: BookComment
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Avatar(url: comment.userPhoto, size: Drawing.avatarSize)
            VStack(alignment: .leading, spacing: 10) {
                Text(comment.nickName).foregroundColor(ThemeColor.dimGray).frame(height: Drawing.avatarSize, alignment: .center)
                Text(comment.text)
            }
        }.padding()
    }
    
    private struct Drawing {
        static let avatarSize = 35.0
    }
}






















struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell(comment: BookComment.mock(id: "1"))
    }
}
