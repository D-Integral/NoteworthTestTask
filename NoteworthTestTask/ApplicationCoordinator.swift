//
//  ApplicationCoordinator.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ApplicationCoordinator: Coordinator, ListCoordinatorDelegate {
  
  let window: UIWindow
  let rootViewController: UINavigationController
  
  let listCoordinator: ListCoordinator
  
  var itemDetailsCoordinator: ItemDetailsCoordinator? = nil
  
  init(window: UIWindow) {
    self.window = window
    
    rootViewController = UINavigationController()
    rootViewController.navigationBar.prefersLargeTitles = true
    
    listCoordinator = ListCoordinator(navigationController: rootViewController)
  }
  
  func start() {
    window.rootViewController = rootViewController
    listCoordinator.addListener(self)
    listCoordinator.start()
    window.makeKeyAndVisible()
  }
  
  func listCoordinatorDidSelectViewModel(_ viewModel: ListViewModelItem) {
    showItemDetails(with: viewModel)
  }
  
  private func showItemDetails(with viewModel: ListViewModelItem) {
    itemDetailsCoordinator = ItemDetailsCoordinator(navigationController: rootViewController,
                                                    viewModel: viewModel)
    
    itemDetailsCoordinator?.start()
  }
}
