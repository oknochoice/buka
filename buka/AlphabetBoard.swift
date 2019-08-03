//
//  AlphabetBoard.swift
//  buka
//
//  Created by yijian on 2019/8/1.
//  Copyright © 2019 yijian. All rights reserved.
//

import Foundation
import UIKit
import CocoaLumberjackSwift

class AlphabetBoard: UIView {
    let lineNo = 4
    var width: CGFloat = 0.0
    var heiht: CGFloat = 0.0
    var earth: EarthKey!
    let firstLinePading: CGFloat = 0.0
    var secondLinePading: CGFloat = 0.0
    var thirdLinePading: CGFloat = 0.0
    var popView:PopView!
    var isSheng: Bool = true
    var firstLine: [KeyModel] = [
        KeyModel(sheng: "q", yun: "iu"),
        KeyModel(sheng: "w", yun: "ei"),
        KeyModel(sheng: "e", yun: "e"),
        KeyModel(sheng: "r", yun: "uan"),
        KeyModel(sheng: "t", yun: "ue"),
        KeyModel(sheng: "y", yun: "un"),
        KeyModel(sheng: "sh", yun: "u"),
        KeyModel(sheng: "ch", yun: "i"),
        KeyModel(sheng: "o", yun: "uo", "o"),
        KeyModel(sheng: "p", yun: "ie")]
    var secondLine: [KeyModel] = [
        KeyModel(sheng: "a", yun: "a"),
        KeyModel(sheng: "s", yun: "ong", "iong"),
        KeyModel(sheng: "d", yun: "ai"),
        KeyModel(sheng: "f", yun: "en"),
        KeyModel(sheng: "g", yun: "eng"),
        KeyModel(sheng: "h", yun: "ang"),
        KeyModel(sheng: "j", yun: "an"),
        KeyModel(sheng: "k", yun: "uai", "ing"),
        KeyModel(sheng: "l", yun: "uang", "iang")]
    var thirdLine: [KeyModel] = [
        KeyModel(sheng: "z", yun: "ou"),
        KeyModel(sheng: "x", yun: "ua", "ia"),
        KeyModel(sheng: "c", yun: "ao"),
        KeyModel(sheng: "zh", yun: "ui", "ü"),
        KeyModel(sheng: "b", yun: "in"),
        KeyModel(sheng: "n", yun: "iao"),
        KeyModel(sheng: "m", yun: "ian")]
    func initKeyboard() {
        self.isSheng = true
        self.setNeedsDisplay()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        width = frame.size.width / CGFloat(firstLine.count)
        heiht = frame.size.height / CGFloat(lineNo)
        self.backgroundColor = UIColor.green
        
        self.popView = PopView(frame: CGRect(x: 0, y: 0, width: 1.8 * width, height: 1.2 * width))
        self.popView.isHidden = true
        self.isUserInteractionEnabled = true
        self.addSubview(popView)
        
        let height4 = heiht - 2 * Key.topPadding
        let y4 = Key.topPadding + 3 * heiht
        // 123
        let b123 = UIButton(frame: CGRect(x: Key.leftPadding, y: y4, width: height4, height:height4 ))
        b123.backgroundColor = Key.backgroundColorOther
        b123.setTitle("123", for: .normal)
        b123.layer.cornerRadius = Key.radius
        b123.clipsToBounds = true
        self.addSubview(b123)
        // 地球
        earth = EarthKey(frame: CGRect(x: b123.frame.maxX + 2 * Key.leftPadding,y: y4 , width: height4, height: height4))
        earth.backgroundColor = Key.backgroundColorOther
        earth.layer.cornerRadius = Key.radius
        earth.clipsToBounds = true
        self.addSubview(earth)
        // 空格
        let bSpaceX = earth.frame.maxX + 2 * Key.leftPadding
        let bRetrunWidth = height4 * 2
        let bSpace = UIButton(frame: CGRect(x: bSpaceX, y: y4, width: frame.size.width - bSpaceX - 3 * Key.leftPadding - bRetrunWidth, height: height4))
        bSpace.setTitle("space", for: .normal)
        bSpace.setTitle("spacexxx", for: .highlighted)
        bSpace.backgroundColor = Key.backgroundColorNormal
        bSpace.layer.cornerRadius = Key.radius
        bSpace.clipsToBounds = true
        self.addSubview(bSpace)
        // 换行
        let bReturn = UIButton(frame: CGRect(x: bSpace.frame.maxX + 2 * Key.leftPadding, y: y4, width: bRetrunWidth, height: height4))
        bReturn.setTitle("return", for: .normal)
        bReturn.backgroundColor = Key.backgroundColorOther
        bReturn.layer.cornerRadius = Key.radius
        bReturn.clipsToBounds = true
        self.addSubview(bReturn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func drawKeyText(key: KeyModel) -> String {
        var text = key.sheng
        if true {
        //if !self.isSheng {
            text = ""
            for t in key.yun {
                text +=  t + "\n"
            }
            if text.last == "\n" {
                text.removeLast()
            }
        }
        return text
    }
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        var drawTextRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        for index in 0..<firstLine.count {
            let r = CGRect(x: CGFloat(index) * width, y: 0, width: width, height: heiht)
            firstLine[index].frame = r
            Key.drawARect(context: ctx, rect: r, draw_rect: &drawTextRect)
            ctx?.setFillColor(Key.backgroundColorNormal.cgColor)
            ctx?.fillPath()
            let key = firstLine[index]
            //(drawKeyText(key: key) as NSString).draw(with: drawTextRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: nil, context: nil)
        }
        secondLinePading = (frame.size.width - CGFloat(secondLine.count) * width) / 2
        for index in 0..<secondLine.count {
            let r = CGRect(x: secondLinePading + CGFloat(index) * width, y: heiht, width: width, height: heiht)
            secondLine[index].frame = r
            Key.drawARect(context: ctx, rect: r, draw_rect: &drawTextRect)
            ctx?.setFillColor(Key.backgroundColorNormal.cgColor)
            ctx?.fillPath()
            let key = secondLine[index]
        }
        thirdLinePading = (frame.size.width - CGFloat(thirdLine.count) * width) / 2
        for index in 0..<thirdLine.count {
            let r = CGRect(x: thirdLinePading + CGFloat(index) * width, y: heiht * 2, width: width, height: heiht)
            thirdLine[index].frame = r
            Key.drawARect(context: ctx, rect: r, draw_rect: &drawTextRect)
            ctx?.setFillColor(Key.backgroundColorNormal.cgColor)
            ctx?.fillPath()
            let key = thirdLine[index]
        }
    }
    
    func popView(key: KeyModel, touch: CGPoint) -> Void {
        var x = touch.x
        var y = touch.y - self.popView.frame.size.height - 15
        if x < self.popView.frame.size.width / 2 {
            x = self.popView.frame.size.width / 2
        }
        if x > self.frame.size.width - self.popView.frame.size.width / 2 {
            x = self.frame.size.width - self.popView.frame.size.width / 2
        }
        if y < -66 + self.popView.frame.size.height / 2 {
            y = -66 + self.popView.frame.size.height / 2
        }
        if y > Key.height * 2 {
            y = Key.height * 2
        }
        self.popView.center = CGPoint(x: x, y: y)
        self.popView.setText(text: key.sheng)
        self.popView.isHidden = false
    }
    func dismissPopView() -> Void {
        self.selectedKey = nil
        self.popView.isHidden = true
    }
    func keyIn(key: KeyModel) -> Void {
        DDLogDebug("key in " + key.sheng)
    }

    func selectButton(point: CGPoint) -> KeyModel? {
        if point.y < 0 {
            //DDLogDebug("select other line")
        }else if point.y <  Key.height {
            return selectFirstLine(point: point)
        }else if point.y < Key.height * 2 {
            return selectSecondLine(point: point)
        }else if point.y < Key.height * 3 {
            return selectthirdLine(point: point)
        }else {
            //DDLogDebug("select other line")
        }
        return nil
    }
    func selectFirstLine(point: CGPoint) -> KeyModel? {
        if point.x >= 0 && point.x <= self.bounds.size.width {
            let x = point.x - firstLinePading
            let positon: Int = Int(x / Key.width)
            if positon < firstLine.count && 0 <= x {
                let item = self.firstLine[positon]
                DDLogDebug(item.sheng)
                return item
            }
        }
        return nil
    }
    func selectSecondLine(point: CGPoint) -> KeyModel? {
        if point.x >= 0 && point.x <= self.bounds.size.width {
            let x = point.x - secondLinePading
            let positon: Int = Int(x / Key.width)
            if positon < secondLine.count && 0 <= x {
                let item = self.secondLine[positon]
                //DDLogDebug(item.sheng)
                return item
            }
        }
        return nil
    }
    func selectthirdLine(point: CGPoint) -> KeyModel? {
        if point.x >= 0 && point.x <= self.bounds.size.width {
            let x = point.x - thirdLinePading
            let positon: Int = Int(x / Key.width)
            if positon < thirdLine.count  && 0 <= x {
                let item = self.thirdLine[positon]
                //DDLogDebug(item.sheng)
                return item
            }
        }
        return nil
    }
    var selectedKey: KeyModel?
    func keyChanged(from: KeyModel?, to: KeyModel?) -> Void {
        var f = from
        if f == nil {
            f = KeyModel(sheng: nil, yun: nil)
        }
        if to != nil {
            DDLogDebug("from: " + f!.sheng + ", to:" + to!.sheng)
        }
    }
    func compareKey(key: KeyModel?) {
        if key != nil && key != selectedKey {
            let from = selectedKey
            selectedKey = key
            keyChanged(from: from, to: selectedKey)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first?.location(in: self) ?? CGPoint(x: -1, y: -1)
        DDLogDebug("touch began")
        compareKey(key: selectButton(point: touch))
        if selectedKey != nil {
            DDLogDebug("pop view")
            popView(key: selectedKey!, touch: touch)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first?.location(in: self) ?? CGPoint(x: -1, y: -1)
        compareKey(key: selectButton(point: touch))
        if selectedKey != nil {
            popView(key: selectedKey!, touch: touch)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if selectedKey != nil {
            keyIn(key: selectedKey!)
        }
        dismissPopView()
    }
}
