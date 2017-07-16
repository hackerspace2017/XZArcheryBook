//
//  TargetViewGestureRegonizerHelper.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/16/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetViewGestureHandleHelper {
    unowned var view: TargetView
    
    init(_ view: TargetView) {
        self.view = view
    }
    
    var bounds: CGRect {
        return view.bounds
    }
    
    private func convertDeviceToLogic(_ point: CGPoint) -> TargetMarkPosition {
        let x = (point.x - bounds.midX) / bounds.midX
        let y = (point.y - bounds.midY) / bounds.midX
        return TargetMarkPosition(x: x, y: y)
    }
    
    public func specifyMark(withLocation point: CGPoint) {
        let position = convertDeviceToLogic(point)
        let mark = TargetMark(position: position)
        view.targetMarks.append(mark)
        view.currentTargetMark = mark
        view.setNeedsDisplay()
    }
    
    public func moveMark(withLocation point: CGPoint) {
        let position = convertDeviceToLogic(point)
        view.currentTargetMark?.position = position
        view.setNeedsDisplay()
    }
    
    public func complete() {
        determineMarkPosition()
        addNewMark()
    }
    
    private func determineMarkPosition() {
    }
    
    private func addNewMark() {
        
    }
    
    public func canceledGesture() {
        
    }
}
