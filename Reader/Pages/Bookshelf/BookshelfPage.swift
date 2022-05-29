//
//  BookshelfPage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI
import SDWebImageSwiftUI
import Introspect

struct BookshelfPage: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel: BookshelfViewModel
    @State var isNavigationBarHidden = true
    
    let scrollViewDelegate = BookshelfPageScrollHandler()
    
    var navigationBar: some View {
        ZStack(alignment: .center) {
            BlurView(blurEffect: UIBlurEffect(style: .systemThinMaterial))
            
            VStack(spacing: 0) {
                Spacer()
                HStack(spacing: 0) {
                    Spacer().frame(width: Drawing.navigationItemWidth * 2)
                    Spacer()
                    Text("书架").font(.bold(.body)())
                    Spacer()
                    Button {} label: {
                        Image("actionbar_checkin").renderingMode(.template).foregroundColor(ThemeColor.darkGray)
                    }.frame(width: Drawing.navigationItemWidth)
                    Button {} label: {
                        Image("actionbar_search").renderingMode(.template).foregroundColor(ThemeColor.darkGray)
                    }.frame(width: Drawing.navigationItemWidth)
                }
                .padding(EdgeInsets(top: 0, leading: Screen.safeAreaInsets.left + 10, bottom: 0, trailing: Screen.safeAreaInsets.right + 10))
                .frame(maxWidth: .infinity)
                Spacer()
                Divider()
            }
            .padding([.top], Screen.safeAreaInsets.top)
        }.frame(height: Screen.navigationBarHeight)
        .transition(.opacity)
    }
    
    var header: some View {
        return ZStack(alignment: .topLeading) {
            if colorScheme == .light {
                Group {
                   Image("bookshelf_bg").resizable()
                   Image("bookshelf_cloud_0").resizable()
                }.frame(height: Drawing.topViewHeight + Screen.safeAreaInsets.top, alignment: .bottom)
            }
            VStack {
                HStack {
                    Spacer()
                    Button {} label: {
                        Image("actionbar_checkin")
                    }.frame(width: Drawing.navigationItemWidth)
                    Button {} label: {
                        Image("actionbar_search")
                    }.frame(width: Drawing.navigationItemWidth)
                }.padding([.top, .trailing])
                firstBook
            }.padding(EdgeInsets(top: Screen.safeAreaInsets.top, leading: Screen.safeAreaInsets.left, bottom: 0, trailing: Screen.safeAreaInsets.right))
        }
    }
    
    @ViewBuilder
    var firstBook: some View {
        if let book = viewModel.books.first {
            HStack {
                BookCover(url: book.imgUrl, width: Drawing.firstBookWidth)
                VStack(alignment: .leading) {
                    Text(book.name).font(.title)
                    DeferNavigationLink {
                        BookDetailPage(id: book.id)
                    } label: {
                        HStack {
                            Text("读至0.2%")
                            Text("继续阅读")
                            Image("bookshelf_continue_read")
                        }
                    }
                }.foregroundColor(Color.white)
                .padding(.leading)
                Spacer()
            }.padding(.leading)
        }
    }
    
    @ViewBuilder
    var gridView: some View {
        let books = viewModel.books
        if books.count <= 1 {
             Spacer()
        } else {
            let items = Array(repeating: GridItem(spacing: Drawing.gridSpacing), count: horizontalSizeClass == .compact ? 3 : 6)
            LazyVGrid(columns: items, spacing: Drawing.gridRunSpacing) {
                 ForEach(books.dropFirst()) { book in
                    BookVItemView(book: book)
                }
            }.padding(Screen.horizontalSafeAreaInsets(padding: Drawing.gridSpacing))
        }
    }
    
    
    var content: some View {
        ZStack(alignment: .top) {
            ScrollView {
                LazyVStack {
                    header
                    gridView
                }.padding(.bottom, Screen.tabbarHeight)
            }
            .background(ThemeColor.card)
            .introspectScrollView { scrollView in
                scrollView.delegate = scrollViewDelegate
                scrollViewDelegate.isNavigationBarHidden = $isNavigationBarHidden
            }
            // Need to set zIndex in ZStack, in order to run transition animation
            // https://stackoverflow.com/questions/57730074/transition-animation-not-working-in-swiftui
            .zIndex(0)
            if !isNavigationBarHidden {
                navigationBar.zIndex(1)
            }
        }.ignoresSafeArea()
    }
    
    var body: some View {
        Group {
            if viewModel.fetchStatus == .fetching {
                ProgressView()
            } else {
                content
            }
        }.onAppear {
            if viewModel.books.count == 0 {
                Task { await  viewModel.fetchData() }
            }
        }
    }
    
    private struct Drawing {
        static let navigationItemWidth = 50.0
        static let topViewHeight = 250.0
        static let firstBookWidth = 120.0
        static let gridSpacing = 15.0
        static let gridRunSpacing = 15.0
    }
}

class BookshelfPageScrollHandler: NSObject, UIScrollViewDelegate {
    var isNavigationBarHidden: Binding<Bool>?
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        withAnimation {
            if scrollView.contentOffset.y > Screen.navigationBarHeight {
                isNavigationBarHidden?.wrappedValue = false
            } else {
                isNavigationBarHidden?.wrappedValue = true
            }
        }
    }
}























































struct BookshelfPage_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfPage(viewModel: BookshelfViewModel.mock()).preferredColorScheme(.light)
    }
}
