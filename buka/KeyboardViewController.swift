//
//  KeyboardViewController.swift
//  buka
//
//  Created by yijian on 2019/8/1.
//  Copyright © 2019 yijian. All rights reserved.
//

import UIKit
import CocoaLumberjackSwift

class KeyboardViewController: UIInputViewController {
    var alphabetBoard:AlphabetBoard!
    var selector: SelectorBoard!
    let screenWidth = UIScreen.main.bounds.size.width
    var heightConstraint: NSLayoutConstraint!
    var nextKeyboardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.isUserInteractionEnabled = true
        self.addAlphaKeyboard()
        
        DDLog.add(DDTTYLogger.sharedInstance)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let window = self.view.window!
        let gr0 = window.gestureRecognizers![0] as UIGestureRecognizer
        let gr1 = window.gestureRecognizers![1] as UIGestureRecognizer
        gr0.delaysTouchesBegan = false
        gr1.delaysTouchesBegan = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let window = self.view.window!
        let gr0 = window.gestureRecognizers![0] as UIGestureRecognizer
        let gr1 = window.gestureRecognizers![1] as UIGestureRecognizer
        gr0.delaysTouchesBegan = true
        gr1.delaysTouchesBegan = true
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Add custom view sizing constraints here
        print(self.view.subviews)
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
    }
    
    func addAlphaKeyboard() {
        let height_selector = CGFloat(66)
        self.selector = SelectorBoard(frame: CGRect(x: 0, y: 0, width: Int(screenWidth), height: Int(height_selector)))
        self.selector.isUserInteractionEnabled = true
        self.selector.backgroundColor = UIColor.blue
        self.view.addSubview(self.selector)
        let height_board = CGFloat(keyboardHeight())
        //let height_board = CGFloat(300)
        self.alphabetBoard = AlphabetBoard(frame: CGRect(x: 0, y: height_selector, width: screenWidth, height: height_board))
        //self.alphabetBoard.translatesAutoresizingMaskIntoConstraints = false
        self.alphabetBoard.isUserInteractionEnabled = true
        self.alphabetBoard.isMultipleTouchEnabled = false
        self.alphabetBoard.isExclusiveTouch = true
        self.alphabetBoard.earth.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.view.addSubview(self.alphabetBoard)
        //let c1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[selector]|", options: .alignAllLeading, metrics: nil, views: ["selector":self.selector!])
        //let c2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|[selector(height)]", options: .alignAllTop, metrics: ["height": height_selector], views: ["selector":self.selector!])
        
        let c1 = NSLayoutConstraint(item: self.view!, attribute: .top, relatedBy: .equal, toItem: self.selector, attribute: .top, multiplier: 1, constant: 0)
        let c2 = NSLayoutConstraint(item: self.selector!, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(height_selector))
        let c3 = NSLayoutConstraint(item: self.view!, attribute: .left, relatedBy: .equal, toItem: self.selector, attribute: .left, multiplier: 1, constant: 0)
        let c4 = NSLayoutConstraint(item: self.view!, attribute: .right, relatedBy: .equal, toItem: self.selector, attribute: .right, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: self.alphabetBoard!, attribute: .top, relatedBy: .equal, toItem: self.selector, attribute: .bottom, multiplier: 1, constant: 0)
        //let top = NSLayoutConstraint(item: self.view!, attribute: .top, relatedBy: .equal, toItem: self.alphabetBoard!, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: self.view!, attribute: .bottom, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .bottom, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: self.alphabetBoard!, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: height_board)
//        let height = NSLayoutConstraint(item: self.alphabetBoard!, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: self.alphabetBoard.frame.size.height)
        let left = NSLayoutConstraint(item: self.view!, attribute: .left, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: self.view!, attribute: .right, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .right, multiplier: 1, constant: 0)
        self.view.addConstraints([top, bottom, height, left, right, c1, c2, c3, c4])
        //self.view.addConstraints([top, bottom, height, left, right ])
        //self.view.addConstraints(c1)
        //self.view.addConstraints(c2)
    }
    func keyboardHeight() -> Float {
        var keyboardheight:Float;
        
        switch screenWidth
        {
        case 320:
            keyboardheight = 216.0;
            break
        case 375:
            keyboardheight = 216.0;
            break
        case 414:
            keyboardheight = 226.0;
            break
        case 480:
            keyboardheight = 162.0;
            break
        case 568:
            keyboardheight = 162.0;
            break
        case 667:
            keyboardheight = 162.0;
            break
        case 736:
            keyboardheight = 162.0;
            break
        case 768:
            keyboardheight = 264.0;
            break
        case 1024:
            keyboardheight = 352.0;
            break
        default:
            keyboardheight = 216.0;
            break
        }
        return keyboardheight
    }
}
