//
//  ListViewModel.swift
//  TodoList
//
//  Created by William on 05/08/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

struct ListViewModelClosures {
  let showDetailView: ((TodoModel) -> Void)?

  let showAddItemView: (([TodoModel]) -> Void)?
}

final class DefaultListViewModel: ListViewModel {
  private let repository: TodoRepository
  private let closures: ListViewModelClosures?

  // MARK: - Output
  var state: Observable<DataState<[TodoModel], Error>> = Observable(.loading(nil))

  var todo: [TodoModel]!

  init(repository: TodoRepository, closures: ListViewModelClosures? = nil) {
    self.repository = repository
    self.closures = closures
  }

  // TODOs: - Refactor here
  private func load(loading: TodoListViewModelLoading) {
    self.repository.fetchTodoList(completion: { result in
      switch result {
      case .success(let data):
        // Append Data
        self.state.value = .success(data)
        self.todo = data
      case .failure(let error):
        self.state.value = .error(error)
      }
    })
  }
}

// MARK: - Input
extension DefaultListViewModel: ListViewModelInput {
  func addTodoItem() {
    closures?.showAddItemView?(todo)
  }

  func getTodoList() {
    load(loading: .screen)
  }

  func itemDidSelect(item: TodoModel) {
    closures?.showDetailView?(item)
  }
}

extension DefaultListViewModel {
  enum State {
    case idle
    case loading
    case loaded([TodoModel])
    case error(Error)
  }

  enum Event {
    case onAppear
    case onSelectItem
    case onLoadItem
    case onFailedToLoadItem(Error)
  }
}
