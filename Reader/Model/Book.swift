//
//  Book.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/22.
//

import Foundation

struct Book: Identifiable, Codable {
    let id: String
    let name: String
    let imgUrl: String
    let author: String
    let introduction: String?
    let status: String
    let type: String
    
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
    
    static func mock(id: String) -> Book {
        Book(id: id, name: "玄门秘境", imgUrl: "http://img-tailor.11222.cn/bcv/big/201802281218042114.jpg", author: "方千金", introduction: "天地间总有那么一方净土，美的让人倾心，总有那么一方秘境，神奇的让人向往。江湖八门，秘境传说，江湖术士，有人的地方就有江湖，有江湖的地方就有风波。隐藏在社会中的三教九流，不为人所知的玄门玄奇。生命之源，文化之本，旷古之谜，风水占卜，千金带你走进神奇的秘境世界！新书希望大家收藏关注", status: "完结", type: "热血")
    }
//    late String id;
//    late String name;
//    late String imgUrl;
//    late String firstChapter;
//    late Chapter lastChapter;
//    late String author;
//    late double price;
//    late double score;
//    late String type;
//    late String introduction;
//    late int chapterCount;
//    late int recommendCount;
//    late int commentCount;
//    late int firstArticleId;
//
//    late List<String> roles;
//    late String status;
//    late double wordCount;
//    late List<String> tags;
//    late bool isLimitedFree;
}
