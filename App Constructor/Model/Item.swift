//
//  Item.swift
//  App Constructor
//
//  Created by Denis Bystruev on 02/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

enum Item {
    case text(String)
    case image(UIImage)
    case container(name: String, items: [Int])
}

typealias Items = [Item]

extension Items {
    
    /// Deletes and item at index
    ///
    /// - Parameter index: index of an item to delete
    mutating func delete(at deletedIndex: Int) {
        remove(at: deletedIndex)
        
        for (index, item) in self.enumerated() {
            if case .container(let name, var items) = item {
                items = items.filter { $0 != deletedIndex }
                items = items.map { $0 < deletedIndex ? $0 : $0 - 1 }
                self[index] = .container(name: name, items: items)
            }
        }
    }
    
    static func loadSample() -> Items {
        return [
            .container(name: "Города", items: [1]),     // 0
            .container(name: "Москва", items: [2, 3]),  // 1
            .image(UIImage()),                          // 2
            .text("Население — 12 млн чел.")            // 3
        ]
    }
}
