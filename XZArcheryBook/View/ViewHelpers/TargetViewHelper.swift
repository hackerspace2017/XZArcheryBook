//
//  TargetViewHelper.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/13/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit
import CoreGraphics

class TargetViewDrawer {
    unowned var view: TargetView
    
    init(_ view: TargetView) {
        self.view = view
    }
    
    var bounds: CGRect {
        return view.bounds
    }
    
    var center: CGPoint {
        return view.center
    }
    
    var diameter: CGFloat {
        return min(bounds.width, bounds.height)
    }
    
    var singleSlice: CGFloat {
        return diameter / 20
    }
    
    func draw(_ ctx: CGContext, to rect: CGRect) {
        assertionFailure()
    }
}

class TargetViewNumbericDrawer: TargetViewDrawer {
    override func draw(_ ctx: CGContext, to rect: CGRect) {
        for i in 0 ..< 20 {
            let rectToDraw = calculatePosition(atLevel: i)
            drawString(at: rectToDraw, withColor: .red)
        }
    }
    
    let stringHeight: CGFloat = 20
    
    private func calculatePosition(atLevel level: Int) -> CGRect {
        return CGRect(x: CGFloat(level) * singleSlice, y: center.y - stringHeight / 2, width: singleSlice, height: stringHeight)
    }
    
    private func drawString(at rect: CGRect, withColor color: UIColor) {
        let str: NSString = "1"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attrs = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!, NSParagraphStyleAttributeName: paragraphStyle]
        str.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
    }
}

class TargetViewBackgroundDrawer: TargetViewDrawer  {
    override func draw(_ ctx: CGContext, to rect: CGRect) {
        paintBackground(with: ctx, to: rect)
        let whiteRegion = calculate(10, levelWith: rect)
        paint(.white, with: ctx, to: whiteRegion)
        var blackCircle = insetRectangle(whiteRegion)
        stroke(.black, with: ctx, to: blackCircle)
        let blackRegion = insetRectangle(blackCircle)
        paint(.black, with: ctx, to: blackRegion)
        let whiteCircle = insetRectangle(blackRegion)
        stroke(.white, with: ctx, to: whiteCircle)
        let cyanRegion = insetRectangle(whiteCircle)
        paint(.cyan, with: ctx, to: cyanRegion)
        blackCircle = insetRectangle(cyanRegion)
        stroke(.black, with: ctx, to: blackCircle)
        let redRegion = insetRectangle(blackCircle)
        paint(.red, with: ctx, to: redRegion)
        blackCircle = insetRectangle(redRegion)
        stroke(.black, with: ctx, to: blackCircle)
        let yellowRect = insetRectangle(blackCircle)
        paint(.yellow, with: ctx, to: yellowRect)
        blackCircle = insetRectangle(yellowRect)
        stroke(.black, with: ctx, to: blackCircle)
    }
    
    private func stroke(_ color: UIColor, with ctx: CGContext, to rect: CGRect) {
        ctx.setStrokeColor(color.cgColor)
        ctx.strokeEllipse(in: rect)
    }
    
    private func paint(_ color: UIColor, with ctx: CGContext, to rect: CGRect) {
        ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)
    }
    
    private func insetRectangle(_ rect: CGRect, insetByLevel level: Int = 1) -> CGRect {
        return rect.insetBy(dx: singleSlice, dy: singleSlice)
    }
    
    private func calculate(_ level: Int, levelWith rect: CGRect) -> CGRect {
        return CGRect(x: center.x - singleSlice * CGFloat(level), y: center.y - singleSlice * CGFloat(level), width: singleSlice * CGFloat(level) * 2, height: singleSlice * CGFloat(level) * 2)
    }
    
    private func paintBackground(with ctx: CGContext, to rect: CGRect) {
        ctx.setFillColor(UIColor.lightGray.cgColor)
        ctx.fill(rect)
    }
}
