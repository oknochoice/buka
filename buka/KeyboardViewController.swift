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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false

        //self.inputView = UIInputView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 500), inputViewStyle: UIInputView.Style.keyboard)
        self.addAlphaKeyboard()
        /*
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
 */
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Add custom view sizing constraints here
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
        let height = CGFloat(keyboardHeight())
        self.alphabetBoard = AlphabetBoard(frame: CGRect(x: 0, y: 0, width: screenWidth, height: height))
        //self.alphabetBoard = AlphabetBoard(frame: CGRect(x: 0, y: 0, width: screenWidth, height: CGFloat(keyboardHeight())))
        self.view.addSubview(self.alphabetBoard)
        let top = NSLayoutConstraint(item: self.view!, attribute: .top, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: self.view!, attribute: .bottom, relatedBy: .equal, toItem: self.alphabetBoard, attribute: .bottom, multiplier: 1, constant: 0)
        self.view.addConstraints([top, bottom])
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
