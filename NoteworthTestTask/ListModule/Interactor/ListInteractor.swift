//
//  ListInteractor.swift
//  NoteworthTestTask
//
//  Created by Dmytryk Skorokhod on 10.01.2021.
//

import UIKit

class ListInteractor {
  private var networkingService: ListNetworkingService
  private var listPages: [ListPage]
  
  init() {
    self.networkingService = ListNetworkingService()
    self.listPages = [ListPage]()
  }
  
  func update() {
    self.networkingService.requestList { listPage in
      print("The first data page has been received from the server: \(listPage)")
      
      self.listPages = [listPage]
      
      self.loadNextPage()
    }
  }

  func loadNextPage() {
    self.networkingService.requestList(after: listPages.last?.data.after) { listPage in
      print("The next page has been received from the server: \(listPage)")
      
      self.listPages.append(listPage)
    }
  }
}
