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
    
    lazy var score1Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 1)
    lazy var score2Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 2)
    lazy var score3Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 3)
    lazy var score4Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 4)
    lazy var score5Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 5)
    lazy var score6Button: UIButton = self.scoreButtonLayoutHelper.makeScoreButton(self, at: 6)
    
    lazy var scoreButtonLayoutHelper = ScoreButtonLayoutHelper()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureScoreButtons()
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

















