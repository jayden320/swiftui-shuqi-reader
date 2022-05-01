//
//  BookshelfViewModel.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/22.
//

import Foundation

class BookshelfViewModel: ObservableObject {
    @Published var fetchStatus: FetchStatus = .idle
    
    @Published var books: [Book] = []
    
    @MainActor
    func fetchData() async {
        if fetchStatus == .fetching {
            return
        }
        do {
            fetchStatus = .fetching
            books = try await BookshelfService.requestBookshelfData()
            fetchStatus = .idle
        } catch {
            fetchStatus = .failed
        }
    }
    
}

extension BookshelfViewModel {
    static func mock() -> BookshelfViewModel {
        let vm = BookshelfViewModel()
        vm.books = [Book.mock(id: "0"), Book.mock(id: "1"), Book.mock(id: "2"), Book.mock(id: "3"), Book.mock(id: "4")]
        return vm
    }
}
