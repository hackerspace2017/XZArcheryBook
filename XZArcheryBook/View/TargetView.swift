//
//  TargetView.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/11/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetView: UIView {
    private var targetMarks: [TargetMark] = [
        TargetMark(score: 0, position: TargetMarkPosition(x: 0.5, y: 0.5)),
        TargetMark(score: 0, position: TargetMarkPosition(x: 1.0, y: 0)),
        TargetMark(score: 0, position: TargetMarkPosition(x: -0.3, y: -0.4)),
        TargetMark(score: 0, position: TargetMarkPosition(x: -0.4, y: -0.2)),
        TargetMark(score: 0, position: TargetMarkPosition(x: -0.3, y: -0.9)),
        TargetMark(score: 0, position: TargetMarkPosition(x: 0.8, y: 0.6)),
    ]
    
    lazy var backgroundDrawer: TargetViewBackgroundDrawer = {
        let drawer = TargetViewBackgroundDrawer()
        return drawer
    }()
    
    lazy var numbericDrawer: TargetViewNumbericDrawer = {
        let drawer = TargetViewNumbericDrawer()
        return drawer
    }()
    
    lazy var markDrawer: TargetMarkDrawer = { [weak self] in
        let drawer = TargetMarkDrawer(with: self!.targetMarks)
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
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureScoreButtons()
        configureScoreLabels()
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
        markDrawer.draw(ctx, to: rect)
    }
}

















