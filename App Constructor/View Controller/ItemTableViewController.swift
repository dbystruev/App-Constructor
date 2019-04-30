//
//  ItemTableViewController.swift
//  App Constructor
//
//  Created by Denis Bystruev on 30/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    let items = Items.loadSample()
    var startIndex = 1
}

// MARK: - UITableViewDataSource
extension ItemTableViewController /*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch items[startIndex] {
        case let .container(name, items):
            navigationItem.title = name
            return items.count
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get item for current row
        let item: Item
        switch items[startIndex] {
        case .container(_, let indexes):
            let index = indexes[indexPath.row]
            item = items[index]
        default:
            item = items[startIndex]
        }
        
        // Confgiure cell for current row
        switch item {
        case .container(let name, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell")!
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = name
            return cell
            
        case .image(let image):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell")!
            // cell.imageView?.image = image
            return cell
            
        case .text(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell")!
            cell.textLabel?.text = text
            return cell
        }
    }
}
