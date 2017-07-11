//
//  TargetViewController.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/11/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
    override func loadView() {
        let v = TargetView(frame: UIScreen.main.bounds)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view = v
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        view.setNeedsDisplay()
    }
}
