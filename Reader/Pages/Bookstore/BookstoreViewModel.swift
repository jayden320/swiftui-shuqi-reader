//
//  BookstoreViewModel.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import Foundation

enum FetchStatus {
    case idle
    case fetching
    case failed
}

class BookstoreViewModel: ObservableObject {
    @Published var fetchStatus: FetchStatus = .idle
    
    let type: BookstoreListType
    @Published var menus: [Menu]?
    @Published var cards: [BookCard] = []
    @Published var carousels: [Carousel]?
    
    init(type: BookstoreListType) {
        self.type = type
        
        fetchData()
    }
    
    func request(completion: ()->Void) {
        guard let url = Bundle.main.url(forResource: type.rawValue, withExtension: "json"),
              let response = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
              let data = json["data"] as? [String: Any],
              let modules = data["module"] as? [[String: Any]] else {
            return
        }
        for module in modules {
            let moduleName = module["m_s_name"] as? String
            let content = module["content"] as? [Any] ?? []
            guard let data = try? JSONSerialization.data(withJSONObject: content, options: []) else {
                continue
            }
            switch moduleName {
            case "top_banner":
                carousels = try? JSONDecoder().decode([Carousel].self, from: data)
            case "menu":
                menus = try? JSONDecoder().decode([Menu].self, from: data)
            default:
                if module["m_s_style"] != nil,
                    let data = try? JSONSerialization.data(withJSONObject: module, options: []),
                    let card = try? JSONDecoder().decode(BookCard.self, from: data) {
                    cards.append(card)
                }
                break
            }
        }
        completion()
    }
    
    func fetchData() {
        fetchStatus = .fetching
        request {
            fetchStatus = .idle
        }
    }
}

enum BookstoreListType: String {
    case excellent = "home_excellent"
    case male = "home_male"
    case female = "home_female"
    case cartoon = "home_cartoon"
    
    func title() -> String {
        switch self {
        case .excellent:
            return "精选"
        case .male:
            return "男生"
        case .female:
            return "女生"
        case .cartoon:
            return "漫画"
        }
    }
}

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
    
    static func mock() -> Book {
        Book(id: "1", name: "玄门秘境", imgUrl: "http://img-tailor.11222.cn/bcv/big/201802281218042114.jpg", author: "方千金", introduction: "天地间总有那么一方净土，美的让人倾心，总有那么一方秘境，神奇的让人向往。江湖八门，秘境传说，江湖术士，有人的地方就有江湖，有江湖的地方就有风波。隐藏在社会中的三教九流，不为人所知的玄门玄奇。生命之源，文化之本，旷古之谜，风水占卜，千金带你走进神奇的秘境世界！新书希望大家收藏关注", status: "完结", type: "热血")
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

struct Menu: Codable {
    let title: String
    let imageName: String
    
    enum CodingKeys: String, CodingKey {
        case title = "toTitle"
        case imageName = "icon"
    }
}

enum BookCardStyle: Int, Codable {
    case unknow
    case grid
    case hybird
    case cell
}

struct BookCard: Codable {
    let title: String
    let style: BookCardStyle
    let books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case title = "m_s_name"
        case style = "m_s_style"
        case books = "content"
    }
}

struct Carousel: Codable {
    let imageUrl: String
    let linkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case linkUrl = "link_url"
    }
}

extension Int {
    public var countDescription: String {
        self > 10000 ? String(format: "%.2f万", Double(self) / 10000.0) : "\(self)"
    }
}
