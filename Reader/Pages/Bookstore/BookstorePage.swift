//
//  BookstorePage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI


struct BookstorePage: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @State var pageIndex = 0
    let viewModel: BookstoreViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            ForEach(0..<viewModel.list.count, id: \.self) { idx in
                if idx == pageIndex  {
                    BookstoreListView(viewModel: viewModel.list[idx]).tag(idx).tag(idx)
                }
            }
            .frame(maxHeight: CGFloat.infinity)
            
            TopBarView(titles: viewModel.list.map { $0.type.title() }, selection: $pageIndex)
        }.ignoresSafeArea()
    }
}






























































struct BookstorePage_Previews: PreviewProvider {
    static var previews: some View {
//        BookstorePage()
        BookstorePage(viewModel: BookstoreViewModel()).preferredColorScheme(.dark)
    }
}
