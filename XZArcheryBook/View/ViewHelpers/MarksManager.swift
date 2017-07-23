//
//  ControlManager.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/23/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class MarksManager {
    let view: TargetView
    private var gestureHandler: TargetViewGestureHandleHelper?
    
    var currentTargetMark: TargetMark?
    var targetMarks: [TargetMark] = []
    
    init(with view: TargetView) {
        self.view = view
        setupGestrues()
    }
    
    var currentIndex: Int? {
        var count = 0
        for i in 0..<targetMarks.count {
            guard let current = currentTargetMark else { return nil }
            if targetMarks[i] === current {
                break
            }
            count += 1
        }
        return count
    }
    
    public func touchBegin(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.location(in: view)
        gestureHandler?.specifyMark(withLocation: point)
    }
    
    private func setupGestrues() {
        gestureHandler = TargetViewGestureHandleHelper(view, manager: self)
        gestureHandler?.updateUI = updateUI
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGR.addTarget(self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGR)
    }
    
    @objc private func handlePanGesture(_ pan: UIPanGestureRecognizer) {
        var point = pan.location(in: view)
        point = makeOffset(point)
        switch pan.state {
        case .began: break
        case .changed: gestureHandler?.moveMark(withLocation: point)
        case .ended: gestureHandler?.complete()
        default: gestureHandler?.canceledGesture()
        }
    }
    
    private func updateUI(str: String) {
        guard let currentIndex = currentIndex else { return }
        switch currentIndex {
        case 0:
            view.score1Button.setTitle(str, for: .normal)
        case 1:
            view.score2Button.setTitle(str, for: .normal)
        case 2:
            view.score3Button.setTitle(str, for: .normal)
        case 3:
            view.score4Button.setTitle(str, for: .normal)
        case 4:
            view.score5Button.setTitle(str, for: .normal)
        case 5:
            view.score6Button.setTitle(str, for: .normal)
        default:
            break
        }
    }
    
    // For easily operating. convert device point to offset device point.
    private func makeOffset(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - 26, y: point.y - 26)
    }
}
