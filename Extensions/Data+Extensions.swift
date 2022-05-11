//
//  Data+Extensions.swift
//  OTTPlatform
//
//  Created by Daksh on 22/02/22.
//

import Foundation

extension Data
{
    func toJsonObject(withReadingOptions options: JSONSerialization.ReadingOptions = .mutableContainers) -> Any? {
        let dictJson = try? JSONSerialization.jsonObject(with: self, options: options)
        return dictJson
    }
}
