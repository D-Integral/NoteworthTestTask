//
//  ItemDetailsPresenter.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 11.01.2021.
//

import Foundation

class ItemDetailsPresenter {
  let viewController: ItemDetailsViewController
  
  init(withViewModel viewModel: ListViewModelItem? = nil) {
    self.viewController = ItemDetailsViewController(nibName: nil, bundle: nil)
    self.viewController.title = "Item Details"
    self.viewController.viewModel = viewModel
  }
}
