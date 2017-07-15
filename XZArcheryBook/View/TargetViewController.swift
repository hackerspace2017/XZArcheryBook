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
        setupTargetView()
    }
    
    private func setupPlaneView() {
        let v = UIView()
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        v.backgroundColor = UIColor.lightGray
        view = v
    }
    
    private func setupTargetView() {
        let v = TargetView(frame: UIScreen.main.bounds)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view = v
    }
    
    private func viewWillTransition() {
        setupPlaneView()
    }
    
    private func viewDidTransition() {
        setupTargetView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        viewWillTransition()
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (_) in
        }) { [weak self] (_) in
            self?.viewDidTransition()
        }
    }
}
