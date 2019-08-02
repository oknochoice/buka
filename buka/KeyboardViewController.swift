//
//  KeyboardViewController.swift
//  buka
//
//  Created by yijian on 2019/8/1.
//  Copyright © 2019 yijian. All rights reserved.
//

import UIKit


class KeyboardViewController: UIInputViewController {
    var alphabetBoard:AlphabetBoard!
    let screenWidth = UIScreen.main.bounds.size.width
    var heightConstraint: NSLayoutConstraint!
    var nextKeyboardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.isUserInteractionEnabled = true
        self.addAlphaKeyboard()
        let b = UIButton(frame: CGRect(x: 0, y: 2, width: 50, height: 50))
        b.setTitle("hehe", for: .normal)
        b.setTitle("goupi", for: .highlighted)
        self.view.addSubview(b)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let height_board = CGFloat(keyboardHeight())
        self.alphabetBoard = AlphabetBoard(frame: CGRect(x: 0, y: 0, width: screenWidth, height: height_board))
        self.alphabetBoard.isUserInteractionEnabled = true
        self.alphabetBoard.isMultipleTouchEnabled = false
        self.alphabetBoard.isExclusiveTouch = true
        self.alphabetBoard.earth.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.view.addSubview(self.alphabetBoard)
        let top = NSLayoutConstraint(item: self.view!, attribute: .top, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: self.view!, attribute: .bottom, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .bottom, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: self.alphabetBoard!, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: self.alphabetBoard.frame.size.height)
        let left = NSLayoutConstraint(item: self.view!, attribute: .left, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: self.view!, attribute: .right, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .right, multiplier: 1, constant: 0)
        self.view.addConstraints([top, bottom, height, left, right])
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
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print(touches.first?.location(in: self.view).x)
    }
}
