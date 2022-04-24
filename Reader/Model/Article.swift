//
//  Article.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/24.
//

import Foundation

struct Article: Identifiable, Codable {
    let id: Int
    let bookId: Int
    let title: String
    let content: String
    let price: Int
    let index: Int
    let nextId: Int
    let preId: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case bookId = "novel_id"
        case title = "title"
        case content = "content"
        case price = "price"
        case index = "index"
        case nextId = "next_id"
        case preId = "prev_id"
    }
}

extension Article {
    static func mock() -> Article {
        let url = Bundle.main.url(forResource: "article_1000", withExtension: "json")!
        let response = try! Data(contentsOf: url)
        let json = try! JSONSerialization.jsonObject(with: response, options: []) as? [String: Any]
        let dataMap = json!["data"] as! [String: Any]
        let data = try! JSONSerialization.data(withJSONObject: dataMap, options: [])
        let article = try! JSONDecoder().decode(Article.self, from: data)
        return article
    }
}
