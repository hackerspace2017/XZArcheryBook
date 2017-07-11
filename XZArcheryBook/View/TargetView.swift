//
//  TargetView.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/11/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetView: UIView {
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        paintBackground(with: ctx, to: rect)
        let whiteRegion = calculate(10, levelWith: rect)
        paint(.white, with: ctx, to: whiteRegion)
        let blackRegion = calculate(8, levelWith: rect)
        paint(.black, with: ctx, to: blackRegion)
        let cyanRegion = calculate(6, levelWith: rect)
        paint(.cyan, with: ctx, to: cyanRegion)
        let redRegion = calculate(4, levelWith: rect)
        paint(.red, with: ctx, to: redRegion)
        let yellowRect = calculate(2, levelWith: rect)
        paint(.yellow, with: ctx, to: yellowRect)
    }
    
    private func paint(_ color: UIColor, with ctx: CGContext, to rect: CGRect) {
        ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)
    }
    
    private func calculate(_ level: Int, levelWith rect: CGRect) -> CGRect {
        let width = min(bounds.width, bounds.height)
        let singleWidth = width / 20
        return CGRect(x: center.x - singleWidth * CGFloat(level), y: center.y - singleWidth * CGFloat(level), width: singleWidth * CGFloat(level) * 2, height: singleWidth * CGFloat(level) * 2)
    }
    
    private func paintBackground(with ctx: CGContext, to rect: CGRect) {
        ctx.setFillColor(UIColor.lightGray.cgColor)
        ctx.fill(rect)
    }
}
