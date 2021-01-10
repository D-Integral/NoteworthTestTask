//
//  ListInteractor.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListInteractor {
  private var networkingManager: ListNetworkingManager
  private var redditItems: [RedditItem]
  
  init() {
    self.networkingManager = ListNetworkingManager()
    self.redditItems = [RedditItem]()
  }
  
  func update() {
    self.networkingManager.update { redditItems in
      self.redditItems = redditItems
    }
  }

  func loadNextPage() {
    self.networkingManager.loadNextPage { redditItems in
      self.redditItems.append(contentsOf: redditItems)
    }
  }
}
