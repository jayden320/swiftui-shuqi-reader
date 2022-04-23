//
//  BookstoreModel.swift
//  Reader
//
//  Created by Jayden Liu on 2022/4/22.
//

import Foundation

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
