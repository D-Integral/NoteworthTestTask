//
//  ItemDetailsCoordinator.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 11.01.2021.
//

import UIKit

class ItemDetailsCoordinator: Coordinator {
  private let navigationController: UINavigationController
  private let presenter: ItemDetailsPresenter
  
  let multicastDelegate = MulticastDelegate<ListCoordinatorDelegate>()

  init(navigationController: UINavigationController, viewModel: ListViewModelItem) {
    self.navigationController = navigationController
    
    self.presenter = ItemDetailsPresenter(withViewModel: viewModel)
  }

  func start() {
    navigationController.pushViewController(self.presenter.viewController, animated: true)
  }
}
