//
//  AddListEvent.swift
//  TodoList
//
//  Created by William on 18/11/19.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

protocol AddListEvent: class {
  func addListTapped(data: [String: Any])
}
