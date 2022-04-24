//
//  BookDetailViewModel.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/23.
//

import Foundation

class BookDetailViewModel: ObservableObject {
    @Published var fetchStatus: FetchStatus = .idle
    
    let bookId: String
    @Published var book: BookDetail?
    @Published var comments: [BookComment]?
    @Published var recommendBooks: [Book]?
    
    init(bookId: String) {
        self.bookId = bookId
        fetchData()
    }
    
    
    func fetchData() {
        fetchStatus = .fetching
        requestDetail()
        requestComments()
        requestrecommendBooks()
        fetchStatus = .idle
    }
    
    func requestDetail(completion: (()->Void)? = nil) {
        guard let url = Bundle.main.url(forResource: "novel_detail", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let dataMap = json["data"] as? [String: Any],
              let data = try? JSONSerialization.data(withJSONObject: dataMap, options: []) else {
            return
        }
        book = try? JSONDecoder().decode(BookDetail.self, from: data)
        completion?()
    }
    
    func requestComments(completion: (()->Void)? = nil) {
        guard let url = Bundle.main.url(forResource: "novel_comment", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let dataMap = json["data"] as? [[String: Any]],
              let data = try? JSONSerialization.data(withJSONObject: dataMap, options: []) else {
            return
        }
        comments = try! JSONDecoder().decode([BookComment].self, from: data)
        completion?()
    }
    
    func requestrecommendBooks(completion: (()->Void)? = nil) {
        guard let url = Bundle.main.url(forResource: "novel_recommend", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let dataMap = json["data"] as? [[String: Any]],
              let data = try? JSONSerialization.data(withJSONObject: dataMap, options: []) else {
            return
        }
        recommendBooks = try! JSONDecoder().decode([Book].self, from: data)
        completion?()
    }
}
