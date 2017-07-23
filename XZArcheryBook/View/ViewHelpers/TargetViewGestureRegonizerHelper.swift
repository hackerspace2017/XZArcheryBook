//
//  TargetViewGestureRegonizerHelper.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/16/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetViewGestureHandleHelper {
    let view: TargetView
    let controlManager: MarksManager
    
    init(_ view: TargetView, manager: MarksManager) {
        self.view = view
        self.controlManager = manager
    }
    
    public func specifyMark(withLocation point: CGPoint) {
        let position = point.convertDevicePointToLogic(with: view.bounds)
        let mark = TargetMark(position: position)
        controlManager.targetMarks.append(mark)
        controlManager.currentTargetMark = mark
        view.setNeedsDisplay()
        view.score1Button.setTitle("\(position.convertToScore())", for: .normal)
    }
    
    public func moveMark(withLocation point: CGPoint) {
        let position = point.convertDevicePointToLogic(with: view.bounds)
        controlManager.currentTargetMark?.position = position
        view.setNeedsDisplay()
        view.score1Button.setTitle("\(position.convertToScore())", for: .normal)
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
