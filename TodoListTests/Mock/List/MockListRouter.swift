//
//  MockListRouter.swift
//  TodoListTests
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import XCTest

@testable import TodoList
class MockListRouter: ListRouter {
  var invokedViewControllerGetter = false
  var invokedViewControllerGetterCount = 0
  var stubbedViewController: UIViewController!
  override var viewController: UIViewController {
    invokedViewControllerGetter = true
    invokedViewControllerGetterCount += 1
    return stubbedViewController
  }
  var invokedPushToAddListRouter = false
  var invokedPushToAddListRouterCount = 0
  var invokedPushToAddListRouterParameters: (viewController: UIViewController?, Void)?
  var invokedPushToAddListRouterParametersList = [(viewController: UIViewController?, Void)]()
  override func pushToAddListRouter(viewController: UIViewController?) {
    invokedPushToAddListRouter = true
    invokedPushToAddListRouterCount += 1
    invokedPushToAddListRouterParameters = (viewController, ())
    invokedPushToAddListRouterParametersList.append((viewController, ()))
  }
}
