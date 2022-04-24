//
//  BookstorePage.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import SwiftUI

struct BookstorePage: View {
    @State var pageIndex = 0
    
    let tabs: [BookstoreListType] = [.excellent, .female, .male, .cartoon]
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $pageIndex) {
                ForEach(0..<4) { idx in
                    BookstoreListView(viewModel: BookstoreViewModel(type: tabs[idx])).tag(idx)
                }
            }.tabViewStyle(.page(indexDisplayMode: .never))
            TopBarView(titles: tabs.map { $0.title() }, selection: $pageIndex)
        }.ignoresSafeArea()
    }
}






























































struct BookstorePage_Previews: PreviewProvider {
    static var previews: some View {
        BookstorePage()
//        BookstorePage().preferredColorScheme(.dark)
    }
}
