//
//  ViewControllerExtension.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

extension UIViewController {
  func add(child: UIViewController, container: UIView) {
    addChild(child)
    child.view.frame = container.bounds
    container.addSubview(child.view)
    child.didMove(toParent: self)
  }
  
  func remove() {
    guard parent != nil else {
      return
    }
    willMove(toParent: nil)
    removeFromParent()
    view.removeFromSuperview()
  }
}
