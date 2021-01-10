//
//  ListPresenter.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListPresenter {
  let viewController: ListTableViewController
  var viewModel: [ListViewModelItem] {
    didSet {
      viewController.update(withViewModel: viewModel)
    }
  }
  
  init() {
    self.viewController = ListTableViewController(nibName: nil, bundle: nil)
    self.viewController.title = "Reddit Top"
    
    self.viewModel = []
  }
  
  func updateViewModel(withRedditItems redditItems: [RedditItem]) {
    let viewModelItems = redditItems.map {
      ListViewModelItem(title: $0.title)
    }
    
    viewModel = viewModelItems
  }
}
