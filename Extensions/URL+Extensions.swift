//
//  URL+Extensions.swift
//  OTTPlatform
//
//  Created by Dksh on 10/05/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import Foundation

extension URL {
    var isDirectory: Bool {
       (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }
}
