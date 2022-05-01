//
//  BookshelfService.swift
//  Reader
//
//  Created by Jayden Liu on 2022/5/1.
//

import Foundation

class BookshelfService {
    
    static func requestBookshelfData() async throws -> [Book] {
        // The delay is to simulate a network request
        try await Task.sleep(nanoseconds: 500 * 1_000_000)
        
        return try await withCheckedThrowingContinuation { continuation in
            guard let url = Bundle.main.url(forResource: "bookshelf", withExtension: "json"),
                  let response = try? Data(contentsOf: url),
                  let json = try? JSONSerialization.jsonObject(with: response, options: []) as? [String: Any],
                  let data = json["data"] as? [[String: Any]],
                  let booksData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
                return
            }
            
            let books = (try? JSONDecoder().decode([Book].self, from: booksData)) ?? []
            continuation.resume(with: Result.success(books))
        }
    }
}
