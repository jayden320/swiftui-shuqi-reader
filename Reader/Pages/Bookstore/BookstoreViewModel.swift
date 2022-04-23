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
    
    
    func fetchData() {
        fetchStatus = .fetching
        request {
            fetchStatus = .idle
        }
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
}
