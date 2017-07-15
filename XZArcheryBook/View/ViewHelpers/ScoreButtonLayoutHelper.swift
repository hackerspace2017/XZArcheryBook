//
//  ScoreButtonLayoutHelper.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/15/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class ScoreButtonLayoutHelper {
    func makeScoreButton(_ view: UIView, at index: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        view.addSubview(button)
        view.addConstraints(makeScoreButtonConstraints(button, at: index))
        return button
    }
    
    func makeScoreButtonConstraints(_ button: UIButton, at index: Int) -> [NSLayoutConstraint] {
        switch index {
        case 1: return makeScore1ButtonConstraints(button)
        case 2: return makeScore2ButtonConstraints(button)
        case 3: return makeScore3ButtonConstraints(button)
        case 4: return makeScore4ButtonConstraints(button)
        case 5: return makeScore5ButtonConstraints(button)
        case 6: return makeScore6ButtonConstraints(button)
        default: return [NSLayoutConstraint]()
        }
    }
    
    private func makeScore6ButtonConstraints(_ button: UIButton) -> [NSLayoutConstraint] {
        return [
            button.pinToTop(64 + 8 + 38 + 38),
            button.pinToRight(-8),
            button.wrapInWidth(0.1, 1),
            button.wrapInHeight(30),
        ]
    }
    
    private func makeScore5ButtonConstraints(_ button: UIButton) -> [NSLayoutConstraint] {
        return [
            button.pinToTop(64 + 8 + 38),
            button.pinToRight(-8),
            button.wrapInWidth(0.1, 1),
            button.wrapInHeight(30),
        ]
    }
    
    private func makeScore4ButtonConstraints(_ button: UIButton) -> [NSLayoutConstraint] {
        return [
            button.pinToTop(64 + 8),
            button.pinToRight(-8),
            button.wrapInWidth(0.1, 1),
            button.wrapInHeight(30),
        ]
    }
    
    private func makeScore3ButtonConstraints(_ button: UIButton) -> [NSLayoutConstraint] {
        return [
            button.pinToTop(64 + 8 + 38 + 38),
            button.pinToLeft(8),
            button.wrapInWidth(0.1, 1),
            button.wrapInHeight(30),
        ]
    }
    
    private func makeScore2ButtonConstraints(_ button: UIButton) -> [NSLayoutConstraint] {
        return [
            button.pinToTop(64 + 8 + 38),
            button.pinToLeft(8),
            button.wrapInWidth(0.1, 1),
            button.wrapInHeight(30),
        ]
    }
    
    private func makeScore1ButtonConstraints(_ button: UIButton) -> [NSLayoutConstraint] {
        return [
            button.pinToTop(64 + 8),
            button.pinToLeft(8),
            button.wrapInWidth(0.1, 1),
            button.wrapInHeight(30),
        ]
    }
}
