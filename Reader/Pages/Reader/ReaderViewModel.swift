//
//  ReaderViewModel.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import Foundation

class ReaderViewModel: ObservableObject {
    @Published var fetchStatus: FetchStatus = .idle
    let bookId: String
    
    @Published var article: Article?
    @Published var progress: Double = 0.0 {
        didSet {
            print("progress did change: \(progress)")
        }
    }
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(bookId: String) {
        self.bookId = bookId
        fetchData()
    }
    
    func fetchData() {
        fetchStatus = .fetching
        requestArticle {
            fetchStatus = .idle
        }
    }
    
    func requestArticle(completion: (()->Void)) {
        guard let url = Bundle.main.url(forResource: "article_1000", withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let dataMap = json["data"] as? [String: Any],
              let data = try? JSONSerialization.data(withJSONObject: dataMap, options: []) else {
            return
        }
        article = try? JSONDecoder().decode(Article.self, from: data)
        completion()
    }
}
