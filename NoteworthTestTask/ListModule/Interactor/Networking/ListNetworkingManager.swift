//
//  ListNetworkingManager.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListNetworkingManager {
  private var networkingService: ListNetworkingService
  private var listPages: [ListPage]
  
  init() {
    self.networkingService = ListNetworkingService()
    self.listPages = [ListPage]()
  }
  
  func update(_ completionHandler: @escaping ([RedditItem]) -> ()) {
    self.networkingService.requestList { [weak self] listPage in
      guard let self = self else { return }
      
      print("The first data page has been received from the server: \(listPage)")
      
      self.listPages = [listPage]
      
      completionHandler(self.redditItems())
    }
  }

  func loadNextPage(_ completionHandler: @escaping ([RedditItem]) -> ()) {
    self.networkingService.requestList(after: listPages.last?.data.after) { [weak self] listPage in
      guard let self = self else { return }
      
      print("The next page has been received from the server: \(listPage)")
      
      self.listPages.append(listPage)
      
      completionHandler(self.redditItems())
    }
  }
  
  private func redditItems() -> [RedditItem] {
    var items = [RedditItem]()
    
    for page in self.listPages {
      for networkingItem in page.data.children {
        let networkingItemData = networkingItem.data
        
        items.append(RedditItem(title: networkingItemData.title,
                                author: networkingItemData.author,
                                created_utc: networkingItemData.created_utc,
                                thumbnail: networkingItemData.thumbnail,
                                thumbnail_height: networkingItemData.thumbnail_height,
                                thumbnail_width: networkingItemData.thumbnail_width,
                                subreddit: networkingItemData.subreddit,
                                num_comments: networkingItemData.num_comments,
                                visited: networkingItemData.visited))
      }
    }
    
    return items
  }
}
