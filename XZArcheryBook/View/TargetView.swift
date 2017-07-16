//
//  TargetView.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/11/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetView: UIView {
    var currentTargetMark: TargetMark?
    var targetMarks: [TargetMark] = []
    
    lazy var backgroundDrawer: TargetViewBackgroundDrawer = {
        let drawer = TargetViewBackgroundDrawer()
        return drawer
    }()
    
    lazy var numbericDrawer: TargetViewNumbericDrawer = {
        let drawer = TargetViewNumbericDrawer()
        return drawer
    }()
    
    lazy var markDrawer: TargetMarkDrawer = {
        let drawer = TargetMarkDrawer()
        return drawer
    }()
    
    private lazy var scoreButtonLayoutHelper = ScoreButtonLayoutHelper()
    private lazy var score1Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 1)
    private lazy var score2Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 2)
    private lazy var score3Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 3)
    private lazy var score4Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 4)
    private lazy var score5Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 5)
    private lazy var score6Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 6)
    
    private lazy var scoreLabelLayoutHelper = ScoreLabelLayoutHelper()
    private lazy var scoreLeftLabel: UILabel = self.scoreLabelLayoutHelper.makeScoreLabel(self, at: 0)
    private lazy var scoreRightLabel: UILabel = self.scoreLabelLayoutHelper.makeScoreLabel(self, at: 1)
    
    private var panGR: UIPanGestureRecognizer = UIPanGestureRecognizer()
    private lazy var gestureHandler = TargetViewGestureHandleHelper(self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGestureRecognizers()
        configureScoreButtons()
        configureScoreLabels()
    }
    
    @objc private func handlePanGesture(_ pan: UIPanGestureRecognizer) {
        var point = pan.location(in: self)
        point = makeOffset(point)
        switch pan.state {
        case .began: gestureHandler.specifyMark(withLocation: point)
        case .changed: gestureHandler.moveMark(withLocation: point)
        case .ended: gestureHandler.complete()
        default: gestureHandler.canceledGesture()
        }
    }
    
    // For easily operating. convert device point to offset device point.
    private func makeOffset(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - 26, y: point.y - 26)
    }
    
    private func configureGestureRecognizers() {
        panGR.addTarget(self, action: #selector(handlePanGesture(_:)))
        addGestureRecognizer(panGR)
    }
    
    private func configureScoreLabels() {
        scoreLeftLabel.text = "1 - 3:"
        scoreRightLabel.text = "4 - 6:"
    }
    
    private func configureScoreButtons() {
        score1Button.setTitle("1", for: .normal)
        score2Button.setTitle("2", for: .normal)
        score3Button.setTitle("3", for: .normal)
        score4Button.setTitle("4", for: .normal)
        score5Button.setTitle("1", for: .normal)
        score6Button.setTitle("1", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        backgroundDrawer.draw(ctx, to: rect)
        numbericDrawer.draw(ctx, to: rect)
        markDrawer.draw(targetMarks, in: ctx, to: rect)
    }
}

















