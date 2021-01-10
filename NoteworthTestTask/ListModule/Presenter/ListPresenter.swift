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
      ListViewModelItem(title: $0.title,
                        author: $0.author,
                        created: relativeTime(fromDate: $0.created_utc),
                        thumbnail: $0.thumbnail,
                        thumbnail_height: $0.thumbnail_height,
                        thumbnail_width: $0.thumbnail_width,
                        subreddit: $0.subreddit,
                        num_comments: $0.num_comments,
                        visited: $0.visited)
    }
    
    viewModel = viewModelItems
  }
  
  func relativeTime(fromDate date: Date) -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full
    return formatter.localizedString(for: date, relativeTo: Date())
  }
}
