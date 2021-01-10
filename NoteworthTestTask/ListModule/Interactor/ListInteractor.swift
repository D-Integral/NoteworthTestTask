//
//  ListInteractor.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListInteractor {
  var redditItems: Box<[RedditItem]>
  
  private var networkingManager: ListNetworkingManager
  
  init() {
    self.networkingManager = ListNetworkingManager()
    self.redditItems = Box([RedditItem]())
  }
  
  func update() {
    self.networkingManager.update { redditItems in
      self.redditItems.value = redditItems
    }
  }

  func loadNextPage() {
    self.networkingManager.loadNextPage { redditItems in
      self.redditItems.value.append(contentsOf: redditItems)
    }
  }
}
