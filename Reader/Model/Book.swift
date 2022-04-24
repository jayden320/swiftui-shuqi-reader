//
//  Book.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/22.
//

import Foundation
import SwiftUI

struct Book: Identifiable, Codable {
    let id: String
    let name: String
    let imgUrl: String
    let author: String
    let introduction: String?
    let status: String?
    let type: String?
    
    private var recommendCountWrapper: StringBacked<Int>?
    var recommendCount: Int {
        get { recommendCountWrapper?.value ?? 0 }
        set {
            recommendCountWrapper?.value = newValue
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "bid"
        case name = "bookname"
        case imgUrl = "book_cover"
        case author = "author_name"
        case recommendCountWrapper = "recommend_num"
        case introduction = "introduction"
        case status = "stat_name"
        case type = "class_name"
    }
}

struct BookDetail: Identifiable, Codable {
    let id: String
    let name: String
    let imgUrl: String
    let author: String
    let introduction: String?
    let status: String
    let type: String
    
    let lastChapter: Chapter
    let price: Double
    let score: Double
    
    let firstArticleId: Int
    let wordCount: Double
    let tags: [String]
    
    private var chapterCountWrapper: StringBacked<Int>?
    var chapterCountCount: Int {
        get { chapterCountWrapper?.value ?? 0 }
        set { chapterCountWrapper?.value = newValue }
    }
    
    private var commentCountWrapper: StringBacked<Int>?
    var commentCount: Int {
        get { commentCountWrapper?.value ?? 0 }
        set { commentCountWrapper?.value = newValue }
    }
    
    private var recommendCountWrapper: StringBacked<Int>?
    var recommendCount: Int {
        get { recommendCountWrapper?.value ?? 0 }
        set { recommendCountWrapper?.value = newValue }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "bid"
        case name = "bookname"
        case imgUrl = "book_cover"
        case author = "author_name"
        case introduction = "introduction"
        case status = "stat_name"
        case type = "class_name"
        case recommendCountWrapper = "recommend_num"
        case lastChapter = "lastChapter"
        case price = "price"
        case score = "score"
        case firstArticleId = "first_article_id"
        case wordCount = "wordCount"
        case tags = "tag"
        case commentCountWrapper = "comment_count"
    }
    
    var statusColor: Color {
        status == "连载" ? ThemeColor.blue : ThemeColor.primary
    }
}

struct Chapter: Identifiable, Codable {
    let id: Int
    let title: String
}

struct BookComment: Identifiable, Codable {
    let id: String
    let nickName: String
    let userPhoto: String
    let text: String
}

// MARK: - Mock

extension BookDetail {
    static func mock() -> BookDetail {
        let url = Bundle.main.url(forResource: "novel_detail", withExtension: "json")!
        let response = try! Data(contentsOf: url)
        let json = try! JSONSerialization.jsonObject(with: response, options: []) as? [String: Any]
        let data = json!["data"] as! [String: Any]
        let bookData = try! JSONSerialization.data(withJSONObject: data, options: [])
        let book = try! JSONDecoder().decode(BookDetail.self, from: bookData)
        return book
    }
}

extension Book {
    static func mock(id: String) -> Book {
        Book(id: id, name: "玄门秘境", imgUrl: "http://img-tailor.11222.cn/bcv/big/201802281218042114.jpg", author: "方千金", introduction: "天地间总有那么一方净土，美的让人倾心，总有那么一方秘境，神奇的让人向往。江湖八门，秘境传说，江湖术士，有人的地方就有江湖，有江湖的地方就有风波。隐藏在社会中的三教九流，不为人所知的玄门玄奇。生命之源，文化之本，旷古之谜，风水占卜，千金带你走进神奇的秘境世界！新书希望大家收藏关注", status: "完结", type: "热血")
    }
}

extension BookComment {
    static func mock(id: String) -> BookComment {
        BookComment(id: id, nickName: "大爷", userPhoto: "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX", text: "神思悠远，故事线拉的极长，但是却又合情合理。由远入深，从现代拉回修真世界，最为精彩的点莫过于这个了。追了那么久，之前觉得不怎么样，后面文笔爆发的简直妙，感觉像是换了个作者似的")
    }
}

