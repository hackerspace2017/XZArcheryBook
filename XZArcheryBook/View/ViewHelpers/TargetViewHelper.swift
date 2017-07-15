//
//  TargetViewHelper.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/13/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

// todo: according to singleSlice width to calculate font size.
// tode: add target mark
class TargetViewDrawer {
    private var rect = CGRect.zero
    
    var bounds: CGRect {
        return rect
    }
    
    var center: CGPoint {
        return CGPoint(x: rect.midX, y: rect.midY)
    }
    
    var whDifference: CGFloat {
        return bounds.width - bounds.height
    }
    
    var diameter: CGFloat {
        return min(bounds.width, bounds.height)
    }
    
    var singleSlice: CGFloat {
        return diameter / 20
    }
    
    func draw(_ ctx: CGContext, to rect: CGRect) {
        self.rect = rect
    }
}

class TargetMarkDrawer: TargetViewDrawer {
    override func draw(_ ctx: CGContext, to rect: CGRect) {
        super.draw(ctx, to: rect)
        
        drawTargetMark(ctx, to: rect)
    }
    
    private func drawTargetMark(_ ctx: CGContext, to rect: CGRect) {
        let path = CGMutablePath()
        path.move(to: rect.mid)
        path.addLine(to: CGPoint(x: rect.mid.x - 10, y: rect.mid.y))
        path.move(to: rect.mid)
        path.addLine(to: CGPoint(x: rect.mid.x + 10, y: rect.mid.y))
        path.move(to: rect.mid)
        path.addLine(to: CGPoint(x: rect.mid.x, y: rect.mid.y - 10))
        path.move(to: rect.mid)
        path.addLine(to: CGPoint(x: rect.mid.x, y: rect.mid.y + 10))
        ctx.addPath(path)
        ctx.setLineCap(CGLineCap.round)
        ctx.setLineWidth(2)
        ctx.setStrokeColor(UIColor.blue.cgColor)
        ctx.strokePath()
//        ctx.setStrokeColor(UIColor.black.cgColor)
//        ctx.strokeEllipse(in: CGRect(origin: rect.mid, size: CGSize(width: 10, height: 10)))
    }
}

class TargetViewNumbericDrawer: TargetViewDrawer {
    override func draw(_ ctx: CGContext, to rect: CGRect) {
        super.draw(ctx, to: rect)
        
        var level = 0
        for i in 0 ..< 20 {
            var color = UIColor.black
            let rectHorizontallyToDraw = calculatePosition(atIndex: i)
            let rectVerticallyToDraw = calculatePosition(atIndex: i, vertically: true)
            switch i {
            case 0,1: level += 1
            case 2,3:
                color = .white
                level += 1
            case 4...8: level += 1
            case 9,10:
                draw(string: "10", at: calculateCenterRect(), withColor: color, withFont: UIFont.preferredFont(forTextStyle: .headline))
                defer { level = 10}
                continue
            case 11...15: level -= 1
            case 16,17:
                color = .white
                level -= 1
            case 18,19: level -= 1
            default:
                break
            }
            drawString(at: rectHorizontallyToDraw, withColor: color, atLevel: level)
            drawString(at: rectVerticallyToDraw, withColor: color, atLevel: level)
        }
    }
    
    let stringHeight: CGFloat = 20
    
    private func calculateCenterRect() -> CGRect {
        return CGRect(x: center.x - stringHeight / 2, y: center.y - stringHeight / 2, width: stringHeight, height: stringHeight)
    }
    
    private func calculatePosition(atIndex level: Int, vertically: Bool = false) -> CGRect {
        var rect = CGRect.zero
        
        if vertically {
            let offset = min(whDifference / 2, 0)
            rect = CGRect(x: center.x - stringHeight / 2, y: CGFloat(level) * singleSlice - offset, width: stringHeight, height: singleSlice)
        } else {
            let offset = max(whDifference / 2, 0)
            rect = CGRect(x: CGFloat(level) * singleSlice + offset, y: center.y - stringHeight / 2, width: singleSlice, height: stringHeight)
        }
        return rect
    }
    
    private func draw(string str: String, at rect: CGRect, withColor color: UIColor, withFont font: UIFont = UIFont.preferredFont(forTextStyle: .body)) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attrs = [NSFontAttributeName: font,
                     NSParagraphStyleAttributeName: paragraphStyle,
                     NSForegroundColorAttributeName: color]
        str.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
    }
    
    private func drawString(at rect: CGRect, withColor color: UIColor, atLevel level: Int) {
        let str = "\(level)"
        draw(string: str, at: rect, withColor: color)
    }
}

class TargetViewBackgroundDrawer: TargetViewDrawer  {
    let level90Color = #colorLiteral(red: 1, green: 1, blue: 0.2156862745, alpha: 1)
    let level78Color = #colorLiteral(red: 0.9803921569, green: 0.07843137255, blue: 0.3529411765, alpha: 1)
    let level56Color = #colorLiteral(red: 0.6078431373, green: 1, blue: 1, alpha: 1)
    let level34Color = #colorLiteral(red: 0.03921568627, green: 0.03921568627, blue: 0.1960784314, alpha: 1)
    let level12Color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    override func draw(_ ctx: CGContext, to rect: CGRect) {
        super.draw(ctx, to: rect)
        
        paintBackground(with: ctx, to: rect)
        let whiteRegion = calculate(10, levelWith: rect)
        paint(level12Color, with: ctx, to: whiteRegion)
        var blackCircle = insetRectangle(whiteRegion)
        stroke(.black, with: ctx, to: blackCircle)
        let blackRegion = insetRectangle(blackCircle)
        paint(level34Color, with: ctx, to: blackRegion)
        let whiteCircle = insetRectangle(blackRegion)
        stroke(.white, with: ctx, to: whiteCircle)
        let cyanRegion = insetRectangle(whiteCircle)
        paint(level56Color, with: ctx, to: cyanRegion)
        blackCircle = insetRectangle(cyanRegion)
        stroke(.black, with: ctx, to: blackCircle)
        let redRegion = insetRectangle(blackCircle)
        paint(level78Color, with: ctx, to: redRegion)
        blackCircle = insetRectangle(redRegion)
        stroke(.black, with: ctx, to: blackCircle)
        let yellowRect = insetRectangle(blackCircle)
        paint(level90Color, with: ctx, to: yellowRect)
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
