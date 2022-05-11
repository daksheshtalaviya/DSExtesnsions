//
//  UITableView+Extensions.swift
//  DS21
//
//  Created by Dksh on 07/09/21.
//  Copyright © 2021 Joker. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib<T: UITableViewCell>(type: T.Type, reuseIdentifier: String? = nil) {
        self.register(type.nib,
                      forCellReuseIdentifier: reuseIdentifier ?? type.className)
    }
    
    func registerForHeaderFooterViewReuseIdentifier<T: UIView>(type: T.Type, reuseIdentifier: String? = nil) {
        self.register(type.nib,
                      forHeaderFooterViewReuseIdentifier: reuseIdentifier ?? type.className)
    }
    
    func reloadDataAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func scrollToBottom(animated: Bool = false) {
        var section = self.numberOfSections
        if section > 0 {
            section = section - 1
            var row = self.numberOfRows(inSection: section)
            if row > 0 {
                row = row - 1
                self.scrollToRow(at: IndexPath(row: row, section: section), at: .bottom, animated: animated)
            }
        }
    }
    
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        var section = self.numberOfSections
        if section > indexPath.section {
            section = section - 1
            let row = self.numberOfRows(inSection: section)
            return row > indexPath.row
        }
        return false
    }
}
