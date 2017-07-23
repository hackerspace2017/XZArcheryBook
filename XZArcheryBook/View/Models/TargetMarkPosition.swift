//
//  TargetMarkPosition.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/15/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import CoreGraphics

struct TargetMarkPosition {
    let x: CGFloat
    let y: CGFloat
    
    public func convertToScore() -> Int {
        let distance = sqrt(x * x + y * y)
        var score = Int(10 - floor(distance * 10))
        if score > 10 {
            score = 10
        } else if score < 0 {
            score = 0
        }
        return score
    }
    
    public func convertLogicPointToDevice(in rect: CGRect) -> CGPoint {
        let diameter: CGFloat = min(rect.width, rect.height)
        let radius: CGFloat = diameter / 2
        let deviceLongth: CGFloat = max(rect.width, rect.height)
        
        var x: CGFloat = 0, y: CGFloat = 0
        let offset = (deviceLongth - diameter) / 2
        if UIDevice.current.orientation.isPortrait {
            x = radius * self.x + radius
            y = radius  * self.y + radius + offset
        } else {
            x = radius * self.x + radius + offset
            y = radius  * self.y + radius
        }
        return CGPoint(x: x, y: y)
    }
}

extension CGPoint {
    func convertDevicePointToLogic(with rect: CGRect) -> TargetMarkPosition {
        let x = (self.x - rect.midX) / rect.midX
        let y = (self.y - rect.midY) / rect.midX
        return TargetMarkPosition(x: x, y: y)
    }
}
