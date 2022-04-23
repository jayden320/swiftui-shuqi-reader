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
    
    init() {
        fetchData()
    }
    
    static func mock() -> BookshelfViewModel {
        let vm = BookshelfViewModel()
        vm.books = [Book.mock(id: "0"), Book.mock(id: "1"), Book.mock(id: "2"), Book.mock(id: "3"), Book.mock(id: "4")]
        return vm
    }
    
    func fetchData() {
        fetchStatus = .fetching
        request {
            fetchStatus = .idle
        }
    }
    
    func request(completion: ()->Void) {
//        let url = Bundle.main.url(forResource: "bookshelf", withExtension: "json")
//              let response = try? Data(contentsOf: url!)
//              let json = try? JSONSerialization.jsonObject(with: response!, options: []) as? [String: Any]
//              let data = json!["data"] as! [[String: Any]]
//        let booksData = try? JSONSerialization.data(withJSONObject: data, options: [])
        guard let url = Bundle.main.url(forResource: "bookshelf", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let data = json["data"] as? [[String: Any]],
              let booksData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            return
        }
        books = (try? JSONDecoder().decode([Book].self, from: booksData)) ?? []
        completion()
    }
}
