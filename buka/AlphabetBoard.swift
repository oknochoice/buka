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
    override init(frame: CGRect) {
        // 1th
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
        /*
        let width = frame.size.width / CGFloat(firstLine().count)
        let heiht = frame.size.height / CGFloat(lineNo)
        self.backgroundColor = #colorLiteral(red: 0.8177122474, green: 0.8286176324, blue: 0.8487907648, alpha: 1)
        for index in 0..<firstLine().count {
            let key = Key(frame: CGRect(x: CGFloat(index) * width, y: 0, width: width, height: heiht))
            self.addSubview(key)
        }
        let secondPadding = (frame.size.width - CGFloat(secondLine().count) * width) / 2
        for index in 0..<secondLine().count {
            let key = Key(frame: CGRect(x: secondPadding + CGFloat(index) * width, y: heiht, width: width, height: heiht))
            self.addSubview(key)
        }
        let thirdPadding = (frame.size.width - CGFloat(thirdLine().count) * width) / 2
        for index in 0..<thirdLine().count {
            let key = Key(frame: CGRect(x: thirdPadding + CGFloat(index) * width, y: heiht * 2, width: width, height: heiht))
            self.addSubview(key)
        }
        let earth = EarthKey(frame: CGRect(x: 0, y: heiht * 2, width: thirdPadding, height: heiht))
        self.addSubview(earth)
 */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(UIColor.yellow.cgColor)
        Key.drawARect(context: ctx, rect: rect)
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
