//
//  TargetView.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/11/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetView: UIView {
    
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
    public lazy var score1Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 1)
    public lazy var score2Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 2)
    public lazy var score3Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 3)
    public lazy var score4Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 4)
    public lazy var score5Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 5)
    public lazy var score6Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 6)
    
    private lazy var undoButton: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 7)
    private lazy var redoButton: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 8)
    
    private lazy var scoreLabelLayoutHelper = ScoreLabelLayoutHelper()
    private lazy var scoreLeftLabel: UILabel = self.scoreLabelLayoutHelper.makeScoreLabel(self, at: 0)
    private lazy var scoreRightLabel: UILabel = self.scoreLabelLayoutHelper.makeScoreLabel(self, at: 1)

    private var marksManager: MarksManager?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGestureRecognizers()
        configureScoreButtons()
        configureScoreLabels()
    }
    
    private func configureGestureRecognizers() {
        marksManager = MarksManager(with: self)
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
        score5Button.setTitle("5", for: .normal)
        score6Button.setTitle("6", for: .normal)
        undoButton.setTitle("undo", for: .normal)
        redoButton.setTitle("redo", for: .normal)
        undoButton.addTarget(self, action: #selector(undo(_:)), for: .touchUpInside)
        redoButton.addTarget(self, action: #selector(redo(_:)), for: .touchUpInside)
    }
    
    @objc private func undo(_ sender: UIButton) {
        marksManager?.undo()
    }
    
    @objc private func redo(_ sender: UIButton) {
        marksManager?.redo()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        backgroundDrawer.draw(ctx, to: rect)
        numbericDrawer.draw(ctx, to: rect)
        markDrawer.draw(marksManager?.targetMarks, in: ctx, to: rect)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        marksManager?.touchBegin(touches, with: event)
    }
}

















