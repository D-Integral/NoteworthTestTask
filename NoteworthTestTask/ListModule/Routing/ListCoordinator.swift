//
//  ListCoordinator.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListCoordinator: Coordinator {
  private let navigationController: UINavigationController
  private let interactor: ListInteractor
  private let presenter: ListPresenter

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    
    self.interactor = ListInteractor()
    self.presenter = ListPresenter()
    
    self.bind()
  }

  func start() {
    navigationController.pushViewController(self.presenter.viewController, animated: true)
    
    self.interactor.update()
  }
  
  private func bind() {
    self.interactor.redditItems.bind { updatedRedditItems in
      self.presenter.updateViewModel(withRedditItems: updatedRedditItems)
    }
  }
}
