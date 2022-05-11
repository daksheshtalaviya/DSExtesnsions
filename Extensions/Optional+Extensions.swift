//
//  Created by Daksh on 27/08/20.
//  Copyright © 2020 The One Technologies. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    //MARK: -

    func `default`(_ value: String = "") -> String {
        guard let unwrapped = self else { return value }
        return unwrapped
    }
}

extension Optional where Wrapped == Bool {
    //MARK: -

    func `default`(_ value: Bool = false) -> Bool {
        guard let unwrapped = self else { return value }
        return unwrapped
    }
}

extension Optional where Wrapped == Int {
    //MARK: -

    func `default`(_ value: Int = 0) -> Int {
        guard let unwrapped = self else { return value }
        return unwrapped
    }
}

extension Optional where Wrapped == Date {
    //MARK: -

    func `default`(_ value: Date = Date()) -> Date {
        guard let unwrapped = self else { return value }
        return unwrapped
    }
}
