//
//  BookDetailPage.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/21.
//

import SwiftUI

struct BookDetailPage: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: BookDetailViewModel
    
    @State var isSummaryUnfold: Bool = false
    @State var isReading = false
    
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
                    Text(introduction).font(.subheadline).lineLimit(isSummaryUnfold ? nil : Drawing.summaryLineLimit).padding(.horizontal)
                    Spacer()
                }.padding(.vertical)
                Image( "detail_up").rotationEffect(Angle(degrees: isSummaryUnfold ? 0 : 180)).padding()
            }.onTapGesture {
                withAnimation {
                    isSummaryUnfold = !isSummaryUnfold
                }
            }
        }
    }
    
    var latestChapter: some View {
        HStack {
            Image("detail_latest")
            Text("最新")
            Text(book.lastChapter.title).foregroundColor(ThemeColor.dimGray)
            Spacer()
            Text(book.status).foregroundColor(book.statusColor)
            Image("arrow_right")
        }.font(.subheadline).padding(Drawing.cellPadding)
    }
    
    var chapter: some View {
        HStack {
            Image("detail_chapter")
            Text("目录")
            Text("共\(book.chapterCountCount)章").foregroundColor(ThemeColor.dimGray)
            Spacer()
            Image("arrow_right")
        }.font(.subheadline).padding(Drawing.cellPadding)
    }
    
    var tags: some View {
        HStack {
            ForEach(0..<book.tags.count, id: \.self) { index in
                let color = Drawing.tagColors[index % 3]
                Text(book.tags[index]).font(.subheadline).foregroundColor(color).padding(Drawing.tagPadding).border(color.opacity(Drawing.tagBorderOpacity))
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
            }.padding(Drawing.sectionPadding)
            Divider()
            ForEach(comments) { comment in
                CommentCell(comment: comment)
            }
            Divider()
            Text("查看全部评论（\(book.commentCount)条）").foregroundColor(ThemeColor.dimGray).font(.subheadline).padding(Drawing.cellPadding).frame( maxWidth: .infinity, alignment: .center)
            Rectangle().foregroundColor(ThemeColor.paper)
        }
    }
    
    @ViewBuilder
    var recommentView: some View {
        if let books = vm.recommendBooks {
            HStack {
                Image("home_tip")
                Text("书友看过本书的人还在看")
            }.padding(Drawing.sectionPadding)
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()]) {
                ForEach(books) { book in
                    BookVItemView(book: book)
                }
            }.padding([.leading, .bottom, .trailing])
        }
    }
    
    var toolBar: some View {
        ZStack(alignment: .top) {
            BlurView(blurEffect: UIBlurEffect(style: .systemThinMaterial)).frame(height: Drawing.toolBarHeight + Screen.safeAreaInsets.bottom)
            VStack(spacing: 0) {
                Divider()
                HStack(alignment: .center) {
                    Button {
                        let alert = UIAlertController(title: "友情提示", message: "已成功添加到书架", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { _ in
                            print("确定")
                        }))
                        alert.show()
                    } label: {
                        Text("加书架").frame(maxWidth: .infinity)
                    }
                    Button {
                        isReading = true
                    } label: {
                        Text("开始阅读").frame(maxWidth: .infinity,maxHeight: Drawing.toolBarButtonHeight).foregroundColor(ThemeColor.card).background(ThemeColor.primary).cornerRadius(Drawing.toolBarButtonCornerRadius)
                    }

                    Button {} label: {
                        Text("下载").frame(maxWidth: .infinity)
                    }
                }.padding(.top, Drawing.toolBarPaddingTop)
            }
        }
    }
    
    var content: some View {
        ZStack(alignment: .bottom) {
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
                }.padding(.bottom, Screen.safeAreaInsets.bottom + Drawing.toolBarHeight)
            }
            toolBar
        }.background(ThemeColor.card).ignoresSafeArea().navigationBarBackButtonHidden(true).navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("pub_back_gray").renderingMode(.template).foregroundColor(ThemeColor.darkGray)
        }))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(vm.book?.name ?? "")
        .fullScreenCover(isPresented: $isReading) {
            ReaderPage(vm: ReaderViewModel(bookId: book.id))
        }
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
        static let toolBarHeight = 50.0
        static let summaryLineLimit = 3
        static let tagPadding = EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)
        static let tagBorderOpacity = 0.3
        static let sectionPadding = EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 15)
        static let toolBarButtonHeight = 40.0
        static let toolBarButtonCornerRadius = 4.0
        static let toolBarPaddingTop = 5.0
    }
}
















struct BookDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailPage(id: "1").preferredColorScheme(.dark)
    }
}
