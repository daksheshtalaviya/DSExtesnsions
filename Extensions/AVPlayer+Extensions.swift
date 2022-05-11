//
//  AVPlayer+Extensions.swift
//  OTTPlatform
//
//  Created by Dksh on 07/05/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import Foundation
import AVFoundation

extension AVPlayer {
    
    var totalDuration: Double { return currentItem?.totalDuration ?? 0 }
}

extension AVPlayerItem {
    
    var totalDuration: Double {
        let seconds = asset.duration.seconds
        return (seconds.isNaN || seconds.isInfinite) ? 0 : seconds
    }
}
