//
//  Created by Daksh on 27/08/20.
//  Copyright © 2020 The One Technologies. All rights reserved.
//

import Foundation

extension Array {
    //MARK: -
    
    var randomObject : Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    func reArrange(fromIndex: Int, toIndex: Int) -> [Element] {
        var arr = self
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)
        return arr
    }
    
    mutating func reArrange(from: Int, to: Int) {
        insert(remove(at: from), at: to)
    }
        
    func combine<T>(_ arrays: Array<T>?...) -> Set<T> {
        return arrays.compactMap{$0}.compactMap{Set($0)}.reduce(Set<T>()){$0.union($1)}
    }
    
}

extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
    
    mutating func remove(_ item: Element) {
        if let index = self.firstIndex(where: {$0 == item}) {
            self.remove(at: index)
        }
    }
    
    mutating func update(_ item: Element) {
        if let index = self.firstIndex(where: {$0 == item}) {
            self.remove(at: index)
            self.insert(item, at: index)
        } else {
            self.append(item)
        }
    }
}
