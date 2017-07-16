//
//  ScoreLabelLayoutHelper.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/16/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class ScoreLabelLayoutHelper {
    func makeScoreLabel(_ view: UIView, at index: Int) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .left
        view.addSubview(label)
        let constraints = makeScoreLabelConstraints(label, at: index)
        view.addConstraints(constraints)
        return label
    }
    
    func makeScoreLabelConstraints(_ label: UILabel, at index: Int) -> [NSLayoutConstraint] {
        switch index {
        case 0: return makeScoreLabel1Constraints(label)
        case 1: return makeScoreLabel2Constraints(label)
        default: return [NSLayoutConstraint]()
        }
    }
    
    func makeScoreLabel1Constraints(_ label: UILabel) -> [NSLayoutConstraint] {
        return [
            label.pinToTop(36),
            label.pinToLeft(8),
            label.wrapInWidth(0.1, 1),
            label.wrapInHeight(26),
        ]
    }
    
    func makeScoreLabel2Constraints(_ label: UILabel) -> [NSLayoutConstraint] {
        return [
            label.pinToTop(36),
            label.pinToRight(-8),
            label.wrapInWidth(0.1, 1),
            label.wrapInHeight(26),
        ]
    }
}
