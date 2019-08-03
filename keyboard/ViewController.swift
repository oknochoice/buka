//
//  ViewController.swift
//  keyboard
//
//  Created by yijian on 2019/8/2.
//  Copyright © 2019 yijian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches.first?.location(in: self.view))
    }


}

