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
    
    // MARK: 数据表格与图形类型切换
    @objc private func changeDataSaveType() {
        print("change type")
        
        serverLayer().userInfo.dataSaveType = 1
        
        let groupVC = XZGroupVC()
        
        groupVC.isGroup = true
        groupVC.delegate = XZHomeVC.self as! XZGroupDelegate
        groupVC.dataSaveType = serverLayer().userInfo.dataSaveType
        
        var controllerArr = self.navigationController?.viewControllers
        
        controllerArr?.removeLast()
        
        controllerArr?.append(groupVC)
        
        self.navigationController?.setViewControllers(controllerArr!, animated: true)
        
        
        
        
//        var targetVC = UIViewController()
//        
//        for vc in controllerArr! {
//            
//            if (vc as AnyObject) .isKind(of: TargetViewController .classForCoder()) {
//                
//                targetVC = vc 
//                
//            }
//            
//        }
//        
//        if targetVC .isKind(of: TargetViewController .classForCoder()) {
//            
//            controllerArr?.removeLast()
//            
//            controllerArr?.append(groupVC)
//            
//            self.navigationController?.setViewControllers(controllerArr!, animated: true)
//        }
        
        
    }
    
    private func setupNavigationItems() {
        let backItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(back))
        let saveItem = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(addTargetMark))
        let changeItem = UIBarButtonItem(title: "切换", style: .plain, target: self, action: #selector(changeDataSaveType))
        navigationItem.rightBarButtonItems = [saveItem, changeItem]
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
