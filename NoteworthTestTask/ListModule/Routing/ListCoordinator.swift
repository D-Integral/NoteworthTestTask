//
//  ListCoordinator.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

protocol ListCoordinatorDelegate: class {
  func listCoordinatorDidSelectViewModel(_ viewModel: ListViewModelItem)
}

class ListCoordinator: Coordinator, ListPresenterDelegate {
  private let navigationController: UINavigationController
  private let interactor: ListInteractor
  private let presenter: ListPresenter
  
  let multicastDelegate = MulticastDelegate<ListCoordinatorDelegate>()

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    
    self.interactor = ListInteractor()
    self.presenter = ListPresenter()
    
    self.bind()
  }

  func start() {
    navigationController.pushViewController(self.presenter.viewController, animated: true)
    self.presenter.addListener(self)
    self.interactor.update()
  }
  
  private func bind() {
    self.interactor.redditItems.bind { updatedRedditItems in
      self.presenter.updateViewModel(withRedditItems: updatedRedditItems)
    }
  }
  
  public func addListener(_ listener: ListCoordinatorDelegate) {
    multicastDelegate.addDelegate(listener)
  }
  
  
  public func removeListener(_ listener: ListCoordinatorDelegate) {
    multicastDelegate.removeDelegate(listener)
  }
  
  func listPresenterDidSelectViewModel(_ viewModel: ListViewModelItem) {
    multicastDelegate.invokeDelegates { listener in
      listener.listCoordinatorDidSelectViewModel(viewModel)
    }
  }
}
