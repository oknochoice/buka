//
//  AlphabetBoard.swift
//  buka
//
//  Created by yijian on 2019/8/1.
//  Copyright © 2019 yijian. All rights reserved.
//

import Foundation
import UIKit

class AlphabetBoard: UIView {
    let lineNo = 4
    var width: CGFloat = 0.0
    var heiht: CGFloat = 0.0
    var earth: EarthKey!
    override init(frame: CGRect) {
        super.init(frame: frame)
        width = frame.size.width / CGFloat(firstLine().count)
        heiht = frame.size.height / CGFloat(lineNo)
        self.backgroundColor = UIColor.white
        
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
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(Key.backgroundColorNormal.cgColor)
        for index in 0..<firstLine().count {
            Key.drawARect(context: ctx, rect: CGRect(x: CGFloat(index) * width, y: 0, width: width, height: heiht))
        }
        let secondPadding = (frame.size.width - CGFloat(secondLine().count) * width) / 2
        for index in 0..<secondLine().count {
            Key.drawARect(context: ctx, rect: CGRect(x: secondPadding + CGFloat(index) * width, y: heiht, width: width, height: heiht))
        }
        let thirdPadding = (frame.size.width - CGFloat(thirdLine().count) * width) / 2
        for index in 0..<thirdLine().count {
            Key.drawARect(context: ctx, rect: CGRect(x: thirdPadding + CGFloat(index) * width, y: heiht * 2, width: width, height: heiht))
        }
        ctx?.fillPath()
    }
    func firstLine() -> [KeyModel] {
        var re:[KeyModel] = []
        re.append(KeyModel(sheng: "q", yun: nil))
        re.append(KeyModel(sheng: "w", yun: nil))
        re.append(KeyModel(sheng: "e", yun: nil))
        re.append(KeyModel(sheng: "r", yun: nil))
        re.append(KeyModel(sheng: "t", yun: nil))
        re.append(KeyModel(sheng: "y", yun: nil))
        re.append(KeyModel(sheng: "u", yun: nil))
        re.append(KeyModel(sheng: "i", yun: nil))
        re.append(KeyModel(sheng: "o", yun: nil))
        re.append(KeyModel(sheng: "p", yun: nil))
        return re
    }
    func secondLine() -> [KeyModel] {
        var re: [KeyModel] = []
        re.append(KeyModel(sheng: "a", yun: nil))
        re.append(KeyModel(sheng: "s", yun: nil))
        re.append(KeyModel(sheng: "d", yun: nil))
        re.append(KeyModel(sheng: "f", yun: nil))
        re.append(KeyModel(sheng: "g", yun: nil))
        re.append(KeyModel(sheng: "h", yun: nil))
        re.append(KeyModel(sheng: "j", yun: nil))
        re.append(KeyModel(sheng: "k", yun: nil))
        re.append(KeyModel(sheng: "l", yun: nil))
        return re
    }
    func thirdLine() -> [KeyModel] {
        var re: [KeyModel] = []
        re.append((KeyModel(sheng: "z", yun: nil)))
        re.append((KeyModel(sheng: "x", yun: nil)))
        re.append((KeyModel(sheng: "c", yun: nil)))
        re.append((KeyModel(sheng: "v", yun: nil)))
        re.append((KeyModel(sheng: "b", yun: nil)))
        re.append((KeyModel(sheng: "n", yun: nil)))
        re.append((KeyModel(sheng: "m", yun: nil)))
        return re
    }
}
