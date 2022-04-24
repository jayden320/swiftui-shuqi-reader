//
//  BookDetailPage.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/21.
//

import SwiftUI

struct BookDetailPage: View {
    @ObservedObject var vm: BookDetailViewModel
    
    @State var isSummaryUnfold: Bool = false
    
    init(id: String) {
        vm = BookDetailViewModel(bookId: id)
    }
    
    private var book: BookDetail {
        vm.book!
    }
    
    @ViewBuilder
    var summary: some View {
        if let introduction = book.introduction {
            ZStack(alignment: .bottomTrailing) {
                HStack {
                    Text(introduction).font(.subheadline).lineLimit(isSummaryUnfold ? nil : 3).padding(.horizontal)
                    Spacer()
                }
                Button {
                    isSummaryUnfold = !isSummaryUnfold
                } label: {
                    Image(isSummaryUnfold ? "detail_up": "detail_down")
                }.padding()
            }.padding(.vertical, 13)
        }
    }
    
    var latestChapter: some View {
        HStack {
            Image("detail_latest")
            Text("最新")
            Text(book.lastChapter.title).foregroundColor(ThemeColor.gray)
            Spacer()
            Text(book.status).foregroundColor(book.statusColor)
            Image("arrow_right")
        }.font(.subheadline).padding(Drawing.cellPadding)
    }
    
    var chapter: some View {
        HStack {
            Image("detail_chapter")
            Text("目录")
            Text("共\(book.chapterCountCount)章").foregroundColor(ThemeColor.gray)
            Spacer()
            Image("arrow_right")
        }.font(.subheadline).padding(Drawing.cellPadding)
    }
    
    var tags: some View {
        HStack {
            ForEach(0..<book.tags.count, id: \.self) { index in
                let color = Drawing.tagColors[index % 3]
                Text(book.tags[index]).font(.subheadline).foregroundColor(color).padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)).border(color.opacity(0.3))
            }
        }.padding(Drawing.cellPadding)
    }
    
    @ViewBuilder
    var commentsView: some View {
        if let comments = vm.comments {
            HStack {
                Image("home_tip")
                Text("书友评价")
                Spacer()
                Image("detail_write_comment")
                Text("写书评").foregroundColor(ThemeColor.primary).font(.subheadline)
            }.padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 15))
            Divider()
            ForEach(comments) { comment in
                CommentCell(comment: comment)
            }
            Divider()
            Text("查看全部评论（\(book.commentCount)条）").foregroundColor(ThemeColor.gray).font(.subheadline).padding(Drawing.cellPadding).frame( maxWidth: .infinity, alignment: .center)
            Rectangle().foregroundColor(ThemeColor.paper)
        }
    }
    
    @ViewBuilder
    var recommentView: some View {
        if let books = vm.recommendBooks {
            HStack {
                Image("home_tip")
                Text("书友看过本书的人还在看")
            }.padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 15))
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()], spacing: 15) {
                ForEach(books) { book in
                    BookVItemView(book: book)
                }
            }.padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
    }
    
    var toolBar: some View {
        ZStack(alignment: .top) {
            Rectangle().foregroundColor(ThemeColor.white).frame(height: 50+Screen.safeAreaInsets.bottom).shadow(color: ThemeColor.lightGray, radius: 5)
            HStack(alignment: .center) {
                Button {
                    
                } label: {
                    Text("加书架").frame(maxWidth: .infinity)
                }
                Button {
                    
                } label: {
                    Text("开始阅读").frame(maxWidth: .infinity,maxHeight: 40).foregroundColor(Color.white).background(ThemeColor.primary).cornerRadius(5)
                }
                Button {
                    
                } label: {
                    Text("下载").frame(maxWidth: .infinity)
                }
            }.padding(.top, 5)
        }
    }
    
    var content: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    Group {
                        BookDetailHeader(book: book)
                        summary
                        Divider().padding(.leading, Drawing.cellDividerLeading)
                        latestChapter
                        Divider().padding(.leading, Drawing.cellDividerLeading)
                        chapter
                        Divider().padding(.leading, Drawing.cellDividerLeading)
                        tags
                        Rectangle().foregroundColor(ThemeColor.paper)
                    }
                    commentsView
                    recommentView
                }
            }
            toolBar
        }.ignoresSafeArea().navigationBarHidden(true)
    }
    
    var body: some View {
        if vm.fetchStatus == .fetching {
            ProgressView()
        } else {
            content
        }
    }
    
    private struct Drawing {
        static let cellPadding = EdgeInsets(top: 13, leading: 15, bottom: 13, trailing: 15)
        static let tagColors = [Color(hex: "F9A19F"), Color(hex: "59DDB9"), Color(hex: "7EB3E7")]
        static let cellDividerLeading = 20.0
    }
}


















struct BookDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailPage(id: "1")
    }
}
