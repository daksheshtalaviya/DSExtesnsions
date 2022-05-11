//
//  Sequence+Extensions.swift
//  DS21
//
//  Created by Dksh on 31/08/21.
//  Copyright © 2021 Joker. All rights reserved.
//

import Foundation

extension Sequence {
    //MARK: -
    
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
}

extension Sequence where Element: AdditiveArithmetic {

    func sum() -> Element {
        return reduce(.zero, +)
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var alreadyAdded = Set<Iterator.Element>()
        return self.filter { alreadyAdded.insert($0).inserted }
    }
}
