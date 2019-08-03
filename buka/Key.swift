//
//  Key.swift
//  buka
//
//  Created by yijian on 2019/8/1.
//  Copyright © 2019 yijian. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class KeyModel: Equatable {
    var sheng = "okno"
    var yun:[String] = []
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    init(sheng: String?, yun: String?...) {
        self.sheng = sheng ?? "okno"
        for item in yun {
            if item != nil {
                self.yun.append(item!)
            }
        }
    }
    static func ==(m1: KeyModel, m2: KeyModel) -> Bool {
        if m1.sheng == m2.sheng {
            return true
        }else {
            return false
        }
    }
}

class Key: NSObject {
    static let leftPadding: CGFloat = 3.0
    static let topPadding: CGFloat = 5.0
    static let radius: CGFloat = 4.0
    static var width_button: CGFloat = 0.0
    static var height_button: CGFloat = 0.0
    static var width: CGFloat = 0.0
    static var height: CGFloat = 0.0
    static let backgroundColorOther = #colorLiteral(red: 0.6351010799, green: 0.6533172727, blue: 0.6979339123, alpha: 1)
    static let backgroundColorNormal = #colorLiteral(red: 0.9755813479, green: 0.7846637368, blue: 0.1785585284, alpha: 1)
        /*
        self.backgroundColor = UIColor.yellow
        self.autoresizesSubviews = false
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.isMultipleTouchEnabled = false;
        self.isExclusiveTouch = true;
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
 */

    
    static func drawARect(context:CGContext?, rect: CGRect, draw_rect: inout CGRect) {
        // 绘制矩形框
        width = rect.size.width
        height = rect.size.height
        let width_l = width - (leftPadding + radius) * 2
        let height_l = height - (topPadding + radius) * 2
        width_button = CGFloat(width - leftPadding * 2)
        height_button = CGFloat(height - topPadding * 2)
        let x_l = rect.origin.x
        let y_l = rect.origin.y
        let leftTop = CGPoint(x: x_l + leftPadding + radius, y: y_l + topPadding + radius)
        let rightTop = CGPoint(x: x_l + leftPadding + radius + width_l, y: y_l + topPadding + radius)
        let leftBottom = CGPoint(x: x_l + leftPadding + radius, y: y_l + topPadding + radius + height_l)
        let rightBottom = CGPoint(x: x_l + leftPadding + radius + width_l, y: y_l + topPadding + radius + height_l)
        //let r = CGRect(x: frame.origin.x + leftPadding, y: frame.origin.y + topPadding, width: frame.size.width - 2 * leftPadding, height: frame.size.height - 2 * topPadding)
        context?.move(to: CGPoint(x: leftTop.x, y: leftTop.y - radius))
        context?.addLine(to: CGPoint(x: rightTop.x, y: rightTop.y - radius))
        context?.addArc(center: rightTop, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: 0, clockwise: false)
        context?.addLine(to: CGPoint(x: rightBottom.x + radius, y: rightBottom.y))
        context?.addArc(center: rightBottom, radius: radius, startAngle: 0, endAngle: CGFloat.pi / 2, clockwise: false)
        context?.addLine(to: CGPoint(x: leftBottom.x, y: leftBottom.y + radius))
        context?.addArc(center: leftBottom, radius: radius, startAngle: CGFloat.pi / 2, endAngle: CGFloat.pi, clockwise: false)
        context?.addLine(to: CGPoint(x: leftTop.x - radius, y: leftTop.y))
        context?.addArc(center: leftTop, radius: radius, startAngle: CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: false)
        context?.closePath()
        draw_rect = CGRect(x: leftTop.x - radius, y: leftTop.y, width: width_button, height: height_button - 2 * radius)
    }
}


class EarthKey:UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext();
        // 画球
        let size:CGSize = rect.size;
        let r:CGFloat =  CGFloat(12); //(size.height - 12) / 2
        let p1:CGPoint = CGPoint(x: rect.origin.x + size.width / 2, y: rect.origin.y + size.height / 2 );//圆心
        let p2:CGPoint  = CGPoint(x: p1.x, y: p1.y - r * sqrt(2));
        let p3:CGPoint = CGPoint(x: p1.x, y: p1.y + r * sqrt(2));
        let p4:CGPoint = CGPoint(x: p1.x - r*3/4, y: p1.y);
        let p5:CGPoint = CGPoint(x: p1.x + r*3/4, y: p1.y);
        context?.setStrokeColor(UIColor.white.cgColor);//设置画笔颜色
        context?.setLineWidth(1.0);//设置线条粗细
        //顺时针画圆
        context?.addArc(center: p1, radius: r, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
        context?.strokePath();
        //画上方的弧线
        context?.addArc(center: p2, radius: r, startAngle: CGFloat.pi / 4, endAngle: CGFloat.pi * 3/4, clockwise: false)
        
        context?.strokePath();
        //画下方的弧线
        context?.addArc(center: p3, radius: r, startAngle: -CGFloat.pi * 3/4, endAngle: -CGFloat.pi/4, clockwise: false)
        context?.strokePath();
        //画右方的弧线
        context?.addArc(center: p4, radius: r * 5 / 4, startAngle: -atan(4/3), endAngle: atan(4/3), clockwise: false)
        context?.strokePath();
        //画左方的弧线
        context?.addArc(center: p5, radius: r * 5/4, startAngle: CGFloat.pi - atan(4/3), endAngle: CGFloat.pi + atan(4/3), clockwise: false)
        context?.strokePath();
        //画从上到下的直线
        context?.move(to: CGPoint(x: p1.x, y: p1.y - r))
        context?.addLine(to: CGPoint(x: p1.x, y: p1.y + r))
        context?.strokePath();
        //画从左到右的直线
        context?.move(to: CGPoint(x: p1.x - r, y: p1.y))
        context?.addLine(to: CGPoint(x: p1.x + r, y: p1.y))
        context?.strokePath();
        
    }
    
    
}

class PopView: UIView {
    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: frame)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addSubview(label)
    }
    
    func setText(text: String?) -> Void {
        label.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
