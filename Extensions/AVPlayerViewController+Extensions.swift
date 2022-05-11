//
//  AVPlayerViewController+Extensions.swift
//  OTTPlatform
//
//  Created by Dksh on 08/05/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import AVKit

extension AVPlayerViewController {
    
    func enableZoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(pinchGesture)
    }
    
    @objc private func startZooming(_ sender: UIPinchGestureRecognizer) {
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
    }
}
