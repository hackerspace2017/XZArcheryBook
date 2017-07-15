//
//  TargetViewController.swift
//  XZArcheryBook
//
//  Created by Andrew Chai on 7/11/17.
//  Copyright © 2017 祥子. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
    private var overlayViewForTransition: UIView?
    
    lazy var toolbar: UIToolbar = ToolbarLayoutHelper.makeToolbar(self.view)
    
    override func loadView() {
        let v = TargetView(frame: UIScreen.main.bounds)
        v.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupToolbar()
        
        // Diable back swipe gesture in UINavigationController
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addTargetMark() {
        print("add new mark")
    }
    
    private func setupNavigationItems() {
        let backItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(back))
        let saveItem = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(addTargetMark))
        navigationItem.rightBarButtonItem = saveItem
        navigationItem.leftBarButtonItem = backItem
    }
    
    private func setupToolbar() {
        toolbar.setItems(nil, animated: true)
    }
    
    private func setupOverlayView() {
        overlayViewForTransition = UIView(frame: view.bounds)
        overlayViewForTransition!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlayViewForTransition!.backgroundColor = UIColor.lightGray
        view.addSubview(overlayViewForTransition!)
    }
    
    private func viewWillTransition() {
        setupOverlayView()
    }
    
    private func viewDidTransition() {
        view.setNeedsDisplay()
        overlayViewForTransition?.removeFromSuperview()
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
