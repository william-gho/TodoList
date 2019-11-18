//
//  ListInteractor.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorInput {
  weak var output: ListInteractorOutput?

  private let coreDataManager: CoreDataManager

  init(coreDataManager: CoreDataManager) {
    self.coreDataManager = coreDataManager
  }

  func fetchTodoList() {
    // output
  }
}
